# Restaurant Business Application - PowerShell Management Scripts

## ✅ Status: Docker Image Created Successfully!

The restaurant-business Docker image has been created and is currently running:

- **Image**: `restaurant-business-app:latest` (80.2MB)
- **Container**: `restaurant-business-container`
- **URL**: <http://localhost:3000>
- **Status**: ✅ Running and responding

## 📋 Available Scripts

### 🚀 `deploy.ps1` - Deploy Application

```powershell
# Basic deployment
.\deploy.ps1

# Deploy on custom port
.\deploy.ps1 -Port 8080

# Skip Angular build
.\deploy.ps1 -SkipBuild

# Show help
.\deploy.ps1 -Help
```

### 📊 `status.ps1` - Check Status

```powershell
# Check application status
.\status.ps1
```

Shows:

- Container running status
- Port mappings
- Application URL
- Resource usage

### 🧹 `cleanup.ps1` - Clean Resources

```powershell
# Clean up Docker resources
.\cleanup.ps1
```

Removes:

- Restaurant-business containers
- Docker images
- Build artifacts (dist folder)

## 🚀 Quick Start

```powershell
# 1. Deploy the application
.\deploy.ps1

# 2. Check status
.\status.ps1

# 3. View logs
docker logs restaurant-business-container

# 4. Clean up when done
.\cleanup.ps1
```

## 🔧 Requirements

- Docker Desktop (running)
- Node.js 18+
- PowerShell 5.1+

## 📝 Current Configuration

- **Port**: 3000 (configurable)
- **Image**: restaurant-business-app
- **Container**: restaurant-business-container
- **Web Server**: Nginx Alpine
- **Build Output**: dist/restaurant-business/browser/

## ⚡ Common Commands

```powershell
# Deploy and start
.\deploy.ps1

# Check if running
.\status.ps1

# View application logs
docker logs restaurant-business-container

# Stop container
docker stop restaurant-business-container

# Complete cleanup
.\cleanup.ps1
```

---

**Restaurant Business Application** - Successfully containerized with PowerShell automation! 🍽️