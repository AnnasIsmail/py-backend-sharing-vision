CREATE DATABASE IF NOT EXISTS article;

USE article;

CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status VARCHAR(100) NOT NULL,
    CONSTRAINT chk_status CHECK (status IN ('publish', 'draft', 'thrash'))
);

INSERT INTO posts (title, content, category, status) VALUES 
(
    'The Future of Artificial Intelligence in Modern Technology',
    'Artificial Intelligence (AI) is rapidly transforming the way we live and work. From machine learning algorithms to natural language processing, AI technologies are becoming increasingly sophisticated and accessible. Companies across various industries are leveraging AI to improve efficiency, reduce costs, and enhance customer experiences. The potential applications of AI are virtually limitless, from autonomous vehicles to personalized healthcare solutions.',
    'Technology',
    'publish'
),
(
    'Cloud Computing: Modern Infrastructure Solutions for Business',
    'Cloud computing has revolutionized how businesses manage their IT infrastructure. By leveraging cloud services from providers like AWS, Google Cloud, and Microsoft Azure, companies can reduce hardware costs and improve scalability. Cloud computing enables teams to work remotely with access to data and applications from anywhere. Data security and disaster recovery become more manageable with the right cloud solutions.',
    'Cloud',
    'publish'
),
(
    'Machine Learning Applications in Financial Services',
    'Machine Learning has brought significant changes to the financial services industry. Banks and fintech companies use ML for fraud detection, credit scoring, and risk analysis. Machine learning algorithms can analyze transaction patterns and identify suspicious activities with high accuracy. Additionally, robo-advisors use ML to provide personalized investment recommendations to clients. This technology continues to evolve and opens new opportunities in digital financial services.',
    'Finance',
    'publish'
),
(
    'Blockchain Technology: Beyond Cryptocurrency Applications',
    'Blockchain is not just about Bitcoin or other cryptocurrencies. This technology has the potential to transform various industries including supply chain, healthcare, and real estate. Blockchain offers transparency, security, and immutability that are essential for digital transactions. Smart contracts enable business process automation without intermediaries. Many countries are exploring blockchain applications for digital certification and product traceability.',
    'Blockchain',
    'draft'
),
(
    'Cybersecurity: Protecting Data in the Digital Age',
    'Cybersecurity has become increasingly important as cyber attacks continue to rise worldwide. Companies must implement multi-layered security strategies including firewalls, encryption, and security awareness training for employees. Ransomware, phishing, and data breaches are among the main threats that need to be addressed. Investment in cybersecurity is no longer optional but necessary to protect company digital assets and customer data.',
    'Security',
    'publish'
),
(
    'Internet of Things (IoT): Connecting Devices Around Us',
    'Internet of Things (IoT) is changing how we interact with everyday devices. From smart home devices to industrial sensors, IoT enables automatic communication between devices. Smart cities use IoT to optimize energy usage, manage traffic, and improve citizens quality of life. IoT adoption continues to increase, especially in manufacturing, agriculture, and smart building sectors. The main challenges are standardization and data security.',
    'IoT',
    'publish'
),
(
    'DevOps Culture: Accelerating Software Development and Deployment',
    'DevOps is a methodology that combines development and operations to improve software delivery speed and quality. With CI/CD (Continuous Integration/Continuous Deployment) practices, teams can release updates more frequently with lower risk. Tools like Docker, Kubernetes, and Jenkins have become standard in DevOps workflows. Collaboration culture between development and operations teams is key to successful DevOps implementation.',
    'DevOps',
    'publish'
),
(
    'Big Data Analytics: Transforming Data into Business Insights',
    'Big Data has become a valuable asset for modern companies. With the right analytics tools, companies can extract valuable insights from large and complex datasets. Data-driven decision making helps companies understand customer behavior, optimize operations, and identify new business opportunities. Technologies like Hadoop, Spark, and data warehousing solutions enable processing data at scale.',
    'Data Science',
    'publish'
),
(
    'Mobile App Development: Trends and Best Practices in 2025',
    'Mobile app development continues to evolve with the emergence of modern frameworks like Flutter and React Native. Cross-platform development allows developers to create apps for iOS and Android with a single codebase. User experience and performance optimization are key focuses in mobile app development. Progressive Web Apps (PWA) also offer an attractive alternative that combines the benefits of web and mobile apps.',
    'Mobile Development',
    'draft'
),
(
    'Quantum Computing: Future Technology That Will Change Everything',
    'Quantum computing is a technology that has the potential to revolutionize computing with unprecedented speed. Unlike classical computers that use bits, quantum computers use qubits that can exist in multiple states simultaneously. This technology can solve complex problems in cryptography, drug discovery, and optimization. Although still in development, major companies like IBM and Google have made significant progress.',
    'Quantum Computing',
    'draft'
),
(
    'Augmented Reality and Virtual Reality in Modern Education',
    'AR and VR are transforming how we learn by providing immersive and interactive experiences. These technologies allow students to conduct virtual lab experiments, explore historical sites, or practice surgical procedures in a safe environment. In corporate training, VR is used to simulate dangerous or complex situations without real risk. Many educational institutions are adopting these technologies despite accessibility challenges.',
    'Education Technology',
    'publish'
),
(
    'Green Technology: Innovation for Environmental Sustainability',
    'Green technology or cleantech focuses on developing environmentally friendly and sustainable solutions. Renewable energy, electric vehicles, and smart grids are examples of green tech that are rapidly developing. Companies are adopting green technology not only for compliance but also for efficiency and cost savings. Solar panels, waste management systems, and energy-efficient buildings are profitable long-term investments.',
    'Green Tech',
    'publish'
),
(
    '5G Network: Ultra-Fast Internet and Future Connectivity',
    '5G technology promises internet speeds much faster than 4G with very low latency. This opens possibilities for new applications like autonomous vehicles, remote surgery, and massive IoT deployments. Several telecommunications operators have started rolling out 5G services in major cities. 5G infrastructure will support smart cities and industrial automation. The main challenges are coverage area and infrastructure investment.',
    'Telecommunications',
    'publish'
),
(
    'Robotic Process Automation (RPA): Automating Repetitive Business Tasks',
    'RPA uses software robots to automate repetitive and rule-based business processes. This technology can improve efficiency, reduce errors, and free up employees to focus on more strategic tasks. RPA is widely used in finance, HR, and customer service for processes like data entry, invoice processing, and report generation. RPA implementation does not require significant system changes and can provide quick ROI.',
    'Automation',
    'publish'
),
(
    'Natural Language Processing: Making Computers Understand Human Language',
    'Natural Language Processing (NLP) is a branch of AI that focuses on interaction between computers and human language. NLP applications include chatbots, sentiment analysis, machine translation, and voice assistants. The development of models like GPT and BERT has dramatically improved NLP capabilities. NLP is used for customer service automation, social media monitoring, and content analysis. The main challenge is handling multiple languages and dialects.',
    'Artificial Intelligence',
    'draft'
),
(
    'Edge Computing: Processing Data Closer to the Source for Optimal Performance',
    'Edge computing brings computational power closer to where data is generated, reducing latency and bandwidth usage. This technology is crucial for real-time applications like autonomous vehicles, industrial IoT, and augmented reality. Unlike centralized cloud computing, edge computing is distributed and can operate offline. This provides better reliability and performance for specific use cases. The combination of edge and cloud computing creates optimal hybrid architecture.',
    'Edge Computing',
    'publish'
),
(
    'Container Technology and Kubernetes for Modern Application Deployment',
    'Container technology like Docker has changed how applications are deployed and managed. Containers provide high portability, consistency, and efficiency. Kubernetes as a container orchestration platform has become the industry standard for managing containerized applications at scale. With Kubernetes, developers can easily deploy, scale, and manage applications across multiple environments. Many technology companies are adopting container-first approaches for cloud-native applications.',
    'Cloud Native',
    'publish'
),
(
    'Digital Transformation: Changing Traditional Business to Digital-First',
    'Digital transformation is not just about technology adoption, but also about culture and business model changes. Companies must change how they operate, interact with customers, and deliver value. E-commerce, digital payments, and online services have become the new normal. The COVID-19 pandemic accelerated digital transformation across various sectors. Companies that fail to adapt will fall behind in competition. Leadership and change management are key factors for successful digital transformation.',
    'Digital Business',
    'publish'
),
(
    'API Economy: Opening Digital Ecosystems Through Application Programming Interfaces',
    'APIs (Application Programming Interface) have become the foundation of the modern digital economy. APIs enable various applications and services to communicate and share data securely. Platform companies like Google, Facebook, and Stripe provide APIs used by millions of developers worldwide. API-first approach in development enables faster innovation and better integration. The API economy is growing rapidly, especially in the fintech sector with Open Banking initiatives.',
    'Software Development',
    'publish'
),
(
    'Low-Code No-Code Platforms: Democratizing Software Development for Everyone',
    'Low-code and no-code platforms enable non-technical users to create applications without extensive programming knowledge. Platforms like Bubble, OutSystems, and Microsoft Power Apps accelerate application development with visual interfaces and pre-built components. This helps companies overcome developer shortages and accelerate digital initiatives. Citizen developers can create business applications to solve specific problems without waiting for the IT department. However, complex applications still require traditional development approaches.',
    'Software Development',
    'thrash'
);