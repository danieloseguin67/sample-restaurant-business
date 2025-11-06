# Restaurant Business - Status Check
Write-Host "Restaurant Business Application Status" -ForegroundColor Green

$container = docker ps --filter "name=restaurant-business-container" --format "{{.ID}}"
if ($container) {
    $status = docker ps --filter "id=$container" --format "{{.Status}}"
    $ports = docker ps --filter "id=$container" --format "{{.Ports}}"
    
    Write-Host "Container: Running" -ForegroundColor Green
    Write-Host "Status: $status" -ForegroundColor Blue
    Write-Host "Ports: $ports" -ForegroundColor Blue
    Write-Host "URL: http://localhost:3000" -ForegroundColor Yellow
} else {
    Write-Host "Container: Not running" -ForegroundColor Red
}
