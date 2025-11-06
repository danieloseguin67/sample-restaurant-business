# Restaurant Business - Cleanup Script
Write-Host "Cleaning up Restaurant Business Application..." -ForegroundColor Yellow

# Stop and remove container
docker stop restaurant-business-container 2>$null
docker rm restaurant-business-container 2>$null
Write-Host "Container removed" -ForegroundColor Green

# Remove image
docker rmi restaurant-business-app 2>$null
Write-Host "Image removed" -ForegroundColor Green

# Remove build artifacts
if (Test-Path "dist") {
    Remove-Item -Recurse -Force "dist"
    Write-Host "Build artifacts cleaned" -ForegroundColor Green
}

Write-Host "Cleanup completed!" -ForegroundColor Green
