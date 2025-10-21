from marshmallow import Schema, fields, validates, ValidationError


class PostSchema(Schema):
    """Schema for validating post data"""
    
    title = fields.Str(required=True)
    content = fields.Str(required=True)
    category = fields.Str(required=True)
    status = fields.Str(required=True)
    
    @validates('title')
    def validate_title(self, value):
        """Validate title: required, minimal 20 karakter"""
        if not value or len(value.strip()) < 20:
            raise ValidationError('Title is required and must be at least 20 characters')
    
    @validates('content')
    def validate_content(self, value):
        """Validate content: required, minimal 200 karakter"""
        if not value or len(value.strip()) < 200:
            raise ValidationError('Content is required and must be at least 200 characters')
    
    @validates('category')
    def validate_category(self, value):
        """Validate category: required, minimal 3 karakter"""
        if not value or len(value.strip()) < 3:
            raise ValidationError('Category is required and must be at least 3 characters')
    
    @validates('status')
    def validate_status(self, value):
        """Validate status: required, harus memilih antara "publish", "draft", "thrash" """
        allowed_statuses = ['publish', 'draft', 'thrash']
        if not value or value.lower() not in allowed_statuses:
            raise ValidationError(f'Status is required and must be one of: {", ".join(allowed_statuses)}')


post_schema = PostSchema()

