# Restaurant Business - Deploy Script
param(
    [int]$Port = 3000,
    [switch]$SkipBuild,
    [switch]$Help
)

if ($Help) {
    Write-Host "Restaurant Business Application - Deploy Script" -ForegroundColor Green
    Write-Host "Usage: .\deploy.ps1 [-Port 3000] [-SkipBuild] [-Help]" -ForegroundColor Yellow
    Write-Host "  -Port      Port to expose (default: 3000)" -ForegroundColor White
    Write-Host "  -SkipBuild Skip Angular build step" -ForegroundColor White
    Write-Host "  -Help      Show this help" -ForegroundColor White
    exit 0
}

Write-Host "Deploying Restaurant Business Application..." -ForegroundColor Green

# Check Docker
docker info > $null 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Docker is not running" -ForegroundColor Red
    exit 1
}

# Build Angular app
if (-not $SkipBuild) {
    Write-Host "Building Angular application..." -ForegroundColor Cyan
    npm run build
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Angular build failed" -ForegroundColor Red
        exit 1
    }
}

# Stop existing container
Write-Host "Stopping existing container..." -ForegroundColor Cyan
docker stop restaurant-business-container 2>$null
docker rm restaurant-business-container 2>$null

# Build Docker image
Write-Host "Building Docker image..." -ForegroundColor Cyan
docker build -t restaurant-business-app .
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Docker build failed" -ForegroundColor Red
    exit 1
}

# Run container
Write-Host "Starting container on port $Port..." -ForegroundColor Cyan
$containerId = docker run -d -p "${Port}:80" --name restaurant-business-container restaurant-business-app

if ($containerId) {
    Write-Host ""
    Write-Host "Deployment Complete!" -ForegroundColor Green
    Write-Host "URL: http://localhost:$Port" -ForegroundColor Yellow
    Write-Host "Container ID: $containerId" -ForegroundColor Blue
    Write-Host ""
    Write-Host "Commands:" -ForegroundColor Cyan
    Write-Host "  Status:  .\status.ps1" -ForegroundColor White
    Write-Host "  Logs:    docker logs restaurant-business-container" -ForegroundColor White
    Write-Host "  Cleanup: .\cleanup.ps1" -ForegroundColor White
} else {
    Write-Host "Error: Failed to start container" -ForegroundColor Red
    exit 1
}
