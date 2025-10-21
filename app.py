from flask import Flask, request, jsonify
from flask_migrate import Migrate
from flask_cors import CORS
from marshmallow import ValidationError
from config import Config
from models import db, Post
from validators import post_schema

app = Flask(__name__)
app.config.from_object(Config)

# Initialize database and migration
db.init_app(app)
migrate = Migrate(app, db)

# Enable CORS for all routes with environment configuration
if app.config['CORS_ENABLED']:
    CORS(
        app, 
        origins=app.config['CORS_ORIGINS'],
        methods=app.config['CORS_METHODS'],
        allow_headers=app.config['CORS_HEADERS']
    )


@app.route('/article/', methods=['POST'])
def create_article():
    """
    Endpoint untuk membuat article baru
    Request Body:
    {
        "title": "",
        "content": "",
        "category": "",
        "status": ""
    }
    """
    try:
        # Get JSON data from request
        data = request.get_json()
        
        if not data:
            return jsonify({'error': 'No data provided'}), 400
        
        # Validate data
        validated_data = post_schema.load(data)
        
        # Create new post
        new_post = Post(
            title=validated_data['title'],
            content=validated_data['content'],
            category=validated_data['category'],
            status=validated_data['status'].lower()
        )
        
        db.session.add(new_post)
        db.session.commit()
        
        return jsonify({
            'message': 'Article created successfully',
            'data': new_post.to_dict()
        }), 201
        
    except ValidationError as err:
        return jsonify({'error': 'Validation failed', 'messages': err.messages}), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500


@app.route('/article/<int:limit>/<int:offset>', methods=['GET'])
def get_articles(limit, offset):
    """
    Endpoint untuk menampilkan seluruh article di database dengan paging
    Parameters:
    - limit: jumlah data yang ditampilkan
    - offset: data dimulai dari index ke berapa
    """
    try:
        # Query posts with pagination - order by status to ensure consistent distribution
        posts = Post.query.order_by(Post.status, Post.id).limit(limit).offset(offset).all()
        
        # Convert to list of dictionaries
        result = [post.to_dict() for post in posts]
        
        # Get total count
        total = Post.query.count()
        
        
        return jsonify({
            'data': result,
            'pagination': {
                'limit': limit,
                'offset': offset,
                'total': total
            }
        }), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/article/status/<status>/<int:limit>/<int:offset>', methods=['GET'])
def get_articles_by_status(status, limit, offset):
    """
    Endpoint untuk menampilkan article berdasarkan status dengan paging
    Parameters:
    - status: publish, draft, atau thrash
    - limit: jumlah data yang ditampilkan
    - offset: data dimulai dari index ke berapa
    """
    try:
        # Validate status
        valid_statuses = ['publish', 'draft', 'thrash']
        if status not in valid_statuses:
            return jsonify({'error': f'Invalid status. Must be one of: {valid_statuses}'}), 400
        
        # Query posts with status filter and pagination
        posts = Post.query.filter_by(status=status).order_by(Post.id).limit(limit).offset(offset).all()
        
        # Convert to list of dictionaries
        result = [post.to_dict() for post in posts]
        
        # Get total count for this status
        total = Post.query.filter_by(status=status).count()
        
        
        return jsonify({
            'data': result,
            'pagination': {
                'limit': limit,
                'offset': offset,
                'total': total,
                'status': status
            }
        }), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/article/<int:id>', methods=['GET'])
def get_article_by_id(id):
    """
    Endpoint untuk menampilkan article dengan id yang di-request
    """
    try:
        post = Post.query.get(id)
        
        if not post:
            return jsonify({'error': 'Article not found'}), 404
        
        return jsonify(post.to_dict()), 200
        
    except Exception as e:
        return jsonify({'error': str(e)}), 500


@app.route('/article/<int:id>', methods=['PUT', 'PATCH', 'POST'])
def update_article(id):
    """
    Endpoint untuk merubah data article dengan id yang di-request
    Request Body:
    {
        "title": "",
        "content": "",
        "category": "",
        "status": ""
    }
    """
    try:
        post = Post.query.get(id)
        
        if not post:
            return jsonify({'error': 'Article not found'}), 404
        
        # Get JSON data from request
        data = request.get_json()
        
        if not data:
            return jsonify({'error': 'No data provided'}), 400
        
        # Validate data
        validated_data = post_schema.load(data)
        
        # Update post
        post.title = validated_data['title']
        post.content = validated_data['content']
        post.category = validated_data['category']
        post.status = validated_data['status'].lower()
        
        db.session.commit()
        
        return jsonify({
            'message': 'Article updated successfully',
            'data': post.to_dict()
        }), 200
        
    except ValidationError as err:
        return jsonify({'error': 'Validation failed', 'messages': err.messages}), 400
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500


@app.route('/article/<int:id>', methods=['DELETE'])
def delete_article(id):
    """
    Endpoint untuk menghapus data article dengan id yang di request
    """
    try:
        post = Post.query.get(id)
        
        if not post:
            return jsonify({'error': 'Article not found'}), 404
        
        db.session.delete(post)
        db.session.commit()
        
        return jsonify({
            'message': 'Article deleted successfully'
        }), 200
        
    except Exception as e:
        db.session.rollback()
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)

