# Restaurant Business Application - PowerShell Scripts

This folder contains PowerShell scripts for managing the Restaurant Business application deployment, monitoring, and maintenance.

## ✅ Successfully Created Docker Image

The Docker image for restaurant-business has been successfully created and tested:
- **Image**: `restaurant-business-app:latest` (80.2MB)
- **Container**: `restaurant-business-container`  
- **Access**: http://localhost:3000
- **Status**: Currently running and responding ✅

## 📁 Available Scripts

### 🚀 `deploy.ps1` - Application Deployment
Builds and deploys the Angular application as a Docker container.

```powershell
# Basic deployment
.\deploy.ps1

# Deploy on custom port
.\deploy.ps1 -Port 8080

# Skip Angular build (use existing dist/)
.\deploy.ps1 -SkipBuild

# Clean up and redeploy
.\deploy.ps1 -CleanUp

# Show help
.\deploy.ps1 -Help
```

**Parameters:**
- `-ImageName`: Docker image name (default: restaurant-business-app)
- `-ContainerName`: Docker container name (default: restaurant-business-container)
- `-Port`: Host port to expose (default: 3000)
- `-SkipBuild`: Skip Angular build step
- `-CleanUp`: Remove existing containers and images before deploying
- `-Help`: Show detailed help information

### 📊 `status.ps1` - Application Status Check
Monitors the health and status of the running application.

```powershell
# Basic status check
.\status.ps1

# Detailed information
.\status.ps1 -Detailed
```

**Features:**
- ✅ Container status and health
- 🌐 Application accessibility test
- 📊 Resource usage monitoring
- 🔌 Port mapping information
- 📦 Docker image availability
- 🔍 Detailed system information (with -Detailed flag)

### 🧹 `cleanup.ps1` - Resource Cleanup
Removes containers, images, and build artifacts.

```powershell
# Standard cleanup
.\cleanup.ps1

# Preview what would be removed
.\cleanup.ps1 -DryRun

# Force removal without confirmation
.\cleanup.ps1 -Force

# Nuclear option - remove everything
.\cleanup.ps1 -All -Force
```

**Parameters:**
- `-DryRun`: Preview what would be removed
- `-Force`: Skip confirmation prompts
- `-All`: Remove all Docker resources and node_modules
- `-Help`: Show help information

### 💻 `dev.ps1` - Development Workflow
Provides common development tasks and utilities.

```powershell
# Start application
.\dev.ps1 start

# Stop application
.\dev.ps1 stop

# Restart application
.\dev.ps1 restart

# View logs
.\dev.ps1 logs

# Follow logs in real-time
.\dev.ps1 logs -Follow

# Open container shell
.\dev.ps1 shell

# Start development server
.\dev.ps1 dev

# Build application
.\dev.ps1 build

# Run tests
.\dev.ps1 test

# Check status
.\dev.ps1 status
```

**Actions:**
- `start` 🚀 Deploy and start the application
- `stop` ⏹️ Stop the running container
- `restart` 🔄 Restart the application
- `logs` 📝 Show container logs
- `shell` 🖥️ Open shell in running container
- `test` 🧪 Run application tests
- `dev` 💻 Start development server (npm start)
- `build` 🔨 Build Angular application
- `status` 📊 Show application status

## 🔧 Prerequisites

### Required Software
- **Docker Desktop**: Must be installed and running
- **Node.js**: Version 18+ recommended
- **PowerShell**: Version 5.1 or PowerShell Core 7+
- **Angular CLI**: Will be installed automatically

### Required Files
- `package.json` - Node.js dependencies
- `angular.json` - Angular configuration
- `dockerfile` - Docker build instructions
- `nginx.conf` - Nginx web server configuration

## 📋 Common Workflows

### 🎯 First Time Setup
```powershell
# Install dependencies
npm install

# Deploy application
.\deploy.ps1

# Check status
.\status.ps1
```

### 🔄 Development Workflow
```powershell
# Start development server
.\dev.ps1 dev

# In another terminal, check production deployment
.\dev.ps1 start
.\dev.ps1 logs -Follow
```

### 🚀 Production Deployment
```powershell
# Clean build and deploy
.\cleanup.ps1
npm install
.\deploy.ps1

# Verify deployment
.\status.ps1 -Detailed
```

### 🐛 Troubleshooting
```powershell
# Check application status
.\status.ps1 -Detailed

# View recent logs
.\dev.ps1 logs -Lines 100

# Access container shell for debugging
.\dev.ps1 shell

# Complete cleanup and redeploy
.\cleanup.ps1 -All -Force
npm install
.\deploy.ps1
```

## 🔍 Monitoring & Logs

### Log Management
```powershell
# View recent logs
docker logs restaurant-business-container

# Follow logs in real-time
docker logs -f restaurant-business-container

# View last 50 lines
.\dev.ps1 logs -Lines 50

# Follow logs using dev script
.\dev.ps1 logs -Follow
```

### Health Checks
```powershell
# Quick status
.\status.ps1

# Detailed health check
.\status.ps1 -Detailed

# Test application endpoint
curl http://localhost:3000
```

## 🌐 Default Configuration

- **Application URL**: http://localhost:3000
- **Container Name**: restaurant-business-container
- **Image Name**: restaurant-business-app
- **Web Server**: Nginx (Alpine Linux)
- **Build Output**: `dist/restaurant-business/browser/`

## 🔧 Customization

### Environment Variables
You can modify the scripts to support environment-specific configurations:

```powershell
# Example: Different environments
.\deploy.ps1 -Port 3001 -ImageName "restaurant-business-dev"
.\deploy.ps1 -Port 3002 -ImageName "restaurant-business-staging"
```

### Docker Configuration
The `dockerfile` and `nginx.conf` can be customized for specific deployment needs:

- SSL/TLS configuration
- Custom nginx modules
- Multi-stage builds
- Environment-specific settings

## 🚨 Error Handling

The scripts include comprehensive error handling:

- ✅ Docker availability checks
- ✅ Port conflict detection
- ✅ Build failure detection
- ✅ Container health verification
- ✅ Graceful cleanup on failures

## 📞 Support

For issues or questions:
1. Check the application logs: `.\dev.ps1 logs`
2. Verify Docker is running: `docker info`
3. Check system status: `.\status.ps1 -Detailed`
4. Try a clean rebuild: `.\cleanup.ps1 -Force && .\deploy.ps1`

---

*Generated for Restaurant Business Application - PowerShell Management Scripts*