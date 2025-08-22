# Single-Server CI/CD Pipeline

A complete Continuous Integration and Continuous Deployment (CI/CD) pipeline implementation using Jenkins and Docker on a single Ubuntu server.

## Overview

This project demonstrates a cost-effective approach to DevOps automation by implementing a full CI/CD pipeline on a single local server, eliminating the need for cloud infrastructure during development and testing phases.

## Architecture

```
GitHub Repository → Jenkins (Poll SCM) → Maven Build → Docker Image → Running Container
```

**Key Components:**
- **Source Control**: GitHub repository with Java web application
- **CI Server**: Jenkins with Poll SCM trigger
- **Build Tool**: Apache Maven
- **Containerization**: Docker
- **Deployment Target**: Local Docker container

## Prerequisites

- Ubuntu Server (tested on Ubuntu)
- Java Development Kit (JDK)
- Apache Maven 3.9.11
- Jenkins
- Docker
- Git

## Pipeline Configuration

### Jenkins Setup

1. **Poll SCM Configuration**: Automatically detects changes in the GitHub repository
2. **Build Process**: Maven compiles and packages the application into a WAR file
3. **Deployment Script**: Execute shell commands for Docker operations

### Build Commands

```bash
# Copy artifact to Docker workspace
cp webapp/target/webapp.war /home/olaab/docker-webapp/

# Navigate to Docker directory
cd /home/olaab/docker-webapp

# Build Docker image
docker build -t dev_prac_image .

# Remove existing container (if any)
docker rm -f dev_prac_container || true

# Deploy new container
docker run -d --name dev_prac_container -p 8091:8080 dev_prac_image
```

## Key Implementation Details

### User Permissions
- Jenkins user must be added to the Docker group for seamless Docker command execution:
  ```bash
  sudo usermod -aG docker jenkins
  sudo systemctl restart jenkins
  ```

### File Permissions
- Proper ownership and permissions configured for Jenkins to access Docker workspace:
  ```bash
  sudo chown jenkins:jenkins /home/olaab/docker-webapp/
  sudo chmod 755 /home/olaab/docker-webapp/
  ```

## Dockerfile

```dockerfile
FROM tomcat:9.0
COPY webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
```

## Deployment Access

- **Application URL**: `http://localhost:8091/webapp/`
- **Container Port Mapping**: Host port 8091 → Container port 8080

## Workflow

1. Developer pushes code changes to GitHub repository
2. Jenkins Poll SCM detects changes automatically
3. Jenkins triggers build process using Maven
4. Maven compiles and packages application into WAR file
5. Jenkins executes shell script to:
   - Copy WAR file to Docker workspace
   - Build new Docker image
   - Remove existing container
   - Deploy new container with updated application
6. Application is immediately available at configured endpoint

## Benefits

- **Cost Effective**: Single server eliminates cloud infrastructure costs during development
- **Fast Feedback**: Automated pipeline provides immediate deployment of changes
- **Full Automation**: End-to-end process from code commit to running application
- **Scalable Foundation**: Architecture can be extended to multi-server environments

## Key Learnings

- Jenkins and Docker can coexist effectively on the same server
- Proper user group management is crucial for seamless automation
- Single-server CI/CD is viable for development and testing environments
- Containerization simplifies deployment and environment consistency

## Future Enhancements

- Add automated testing stages
- Implement multi-environment deployments (dev/staging/prod)
- Add monitoring and logging capabilities
- Integrate with cloud providers for production deployment

## Troubleshooting

**Common Issues:**
- Container name conflicts: Resolved by removing existing containers before deployment
- Permission errors: Ensure Jenkins user has proper Docker group membership
- Build failures: Verify Maven configuration and Java compatibility

---

*This pipeline demonstrates that complex DevOps automation doesn't always require expensive cloud infrastructure and can be effectively implemented on local resources.*
