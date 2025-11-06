# Restaurant Business Application - Development Workflow Script# Restaurant Business Application - Development Workflow Script# Restaurant Business Application - Development Workflow Script

param(

    [string]$Action = "help"param(# Provides common development tasks and utilities

)

    [string]$Action = "help",

if ($Action -eq "help") {

    Write-Host "🍽️  Restaurant Business Application - Development Workflow" -ForegroundColor Green    [switch]$Follow,param(

    Write-Host ""

    Write-Host "Usage: .\dev.ps1 <action>" -ForegroundColor Yellow    [int]$Lines = 50,    [ValidateSet("start", "stop", "restart", "logs", "shell", "test", "dev", "build", "status", "help")]

    Write-Host ""

    Write-Host "Actions:" -ForegroundColor Yellow    [switch]$Help    [string]$Action = "help",

    Write-Host "  start     Deploy and start the application"

    Write-Host "  stop      Stop the running container")    [switch]$Follow,

    Write-Host "  restart   Restart the application"

    Write-Host "  logs      Show container logs"    [switch]$Tail,

    Write-Host "  status    Show application status"

    Write-Host "  build     Build Angular application"if ($Help -or $Action -eq "help") {    [int]$Lines = 50,

    Write-Host "  dev       Start development server"

    exit 0    Write-Host "🍽️  Restaurant Business Application - Development Workflow" -ForegroundColor Green    [switch]$Help

}

    Write-Host "========================================================" -ForegroundColor Green)

$containerName = "restaurant-business-container"

    Write-Host ""

switch ($Action.ToLower()) {

    "start" {    Write-Host "Usage: .\dev.ps1 <action> [options]" -ForegroundColor Yellowif ($Help -or $Action -eq "help") {

        Write-Host "🚀 Starting Restaurant Business Application" -ForegroundColor Cyan

        .\deploy.ps1    Write-Host ""    Write-Host "🍽️  Restaurant Business Application - Development Workflow" -ForegroundColor Green

    }

    "stop" {    Write-Host "Actions:" -ForegroundColor Yellow    Write-Host "========================================================" -ForegroundColor Green

        Write-Host "⏹️ Stopping application" -ForegroundColor Cyan

        docker stop $containerName    Write-Host "  start     🚀 Deploy and start the application"    Write-Host ""

    }

    "restart" {    Write-Host "  stop      ⏹️  Stop the running container"    Write-Host "Usage: .\dev.ps1 <action> [options]" -ForegroundColor Yellow

        Write-Host "🔄 Restarting application" -ForegroundColor Cyan

        docker stop $containerName 2>$null    Write-Host "  restart   🔄 Restart the application"    Write-Host ""

        docker rm $containerName 2>$null

        .\deploy.ps1    Write-Host "  logs      📝 Show container logs"    Write-Host "Actions:" -ForegroundColor Yellow

    }

    "logs" {    Write-Host "  shell     🖥️  Open shell in running container"    Write-Host "  start     🚀 Deploy and start the application"

        Write-Host "📝 Application logs" -ForegroundColor Cyan

        docker logs $containerName    Write-Host "  test      🧪 Run application tests"    Write-Host "  stop      ⏹️  Stop the running container"

    }

    "status" {    Write-Host "  dev       💻 Start development server"    Write-Host "  restart   🔄 Restart the application (stop + start)"

        .\status.ps1

    }    Write-Host "  build     🔨 Build Angular application"    Write-Host "  logs      📝 Show container logs"

    "build" {

        Write-Host "🔨 Building Angular application" -ForegroundColor Cyan    Write-Host "  status    📊 Show application status"    Write-Host "  shell     🖥️  Open shell in running container"

        npm run build

    }    exit 0    Write-Host "  test      🧪 Run application tests"

    "dev" {

        Write-Host "💻 Starting development server" -ForegroundColor Cyan}    Write-Host "  dev       💻 Start development server (npm start)"

        npm start

    }    Write-Host "  build     🔨 Build Angular application"

    default {

        Write-Host "Unknown action: $Action" -ForegroundColor Red$containerName = "restaurant-business-container"    Write-Host "  status    📊 Show application status"

        Write-Host "Run '.\dev.ps1 help' for usage information" -ForegroundColor Yellow

    }    Write-Host ""

}
function Write-Header($message) {    Write-Host "Log Options:" -ForegroundColor Yellow

    Write-Host ""    Write-Host "  -Follow   📡 Follow log output (like tail -f)"

    Write-Host "🔹 $message" -ForegroundColor Cyan    Write-Host "  -Tail     📜 Show only recent logs"

}    Write-Host "  -Lines    📏 Number of log lines to show (default: 50)"

    Write-Host ""

function Test-ContainerRunning {    Write-Host "Examples:" -ForegroundColor Yellow

    $container = docker ps --filter "name=$containerName" --format "{{.ID}}" 2>$null    Write-Host "  .\dev.ps1 start                    # Deploy and start"

    return $null -ne $container    Write-Host "  .\dev.ps1 logs -Follow            # Follow logs in real-time"

}    Write-Host "  .\dev.ps1 logs -Lines 100         # Show last 100 log lines"

    Write-Host "  .\dev.ps1 shell                   # Open container shell"

function Test-ContainerExists {    Write-Host "  .\dev.ps1 dev                     # Start development server"

    $container = docker ps -a --filter "name=$containerName" --format "{{.ID}}" 2>$null    exit 0

    return $null -ne $container}

}

$containerName = "restaurant-business-container"

switch ($Action.ToLower()) {

    "start" {function Write-Header($message) {

        Write-Header "Starting Restaurant Business Application"    Write-Host ""

        .\deploy.ps1    Write-Host "🔹 $message" -ForegroundColor Cyan

    }}

    "stop" {

        Write-Header "Stopping application"function Test-ContainerRunning {

        if (Test-ContainerRunning) {    $container = docker ps --filter "name=$containerName" --format "{{.ID}}" 2>$null

            docker stop $containerName | Out-Null    return $null -ne $container

            Write-Host "✅ Application stopped" -ForegroundColor Green}

        } else {

            Write-Host "ℹ️  Application is not running" -ForegroundColor Bluefunction Test-ContainerExists {

        }    $container = docker ps -a --filter "name=$containerName" --format "{{.ID}}" 2>$null

    }    return $null -ne $container

    "restart" {}

        Write-Header "Restarting application"

        if (Test-ContainerExists) {switch ($Action.ToLower()) {

            docker stop $containerName 2>$null | Out-Null    "start" {

            docker rm $containerName 2>$null | Out-Null        Write-Header "Starting Restaurant Business Application"

        }        .\deploy.ps1

        .\deploy.ps1    }

    }    

    "logs" {    "stop" {

        Write-Header "Application logs"        Write-Header "Stopping application"

        if (Test-ContainerExists) {        if (Test-ContainerRunning) {

            if ($Follow) {            docker stop $containerName | Out-Null

                docker logs --follow $containerName            Write-Host "✅ Application stopped" -ForegroundColor Green

            } elseif ($Lines -gt 0) {        } else {

                docker logs --tail $Lines $containerName            Write-Host "ℹ️  Application is not running" -ForegroundColor Blue

            } else {        }

                docker logs $containerName    }

            }    

        } else {    "restart" {

            Write-Host "❌ Container not found" -ForegroundColor Red        Write-Header "Restarting application"

        }        if (Test-ContainerExists) {

    }            docker stop $containerName 2>$null | Out-Null

    "shell" {            docker rm $containerName 2>$null | Out-Null

        Write-Header "Opening container shell"        }

        if (Test-ContainerRunning) {        .\deploy.ps1

            Write-Host "💡 Type 'exit' to leave the shell" -ForegroundColor Yellow    }

            docker exec -it $containerName /bin/sh    

        } else {    "logs" {

            Write-Host "❌ Container is not running" -ForegroundColor Red        Write-Header "Application logs"

        }        if (Test-ContainerExists) {

    }            $logArgs = @()

    "test" {            if ($Follow) { $logArgs += "--follow" }

        Write-Header "Running tests"            if ($Tail -or $Lines -gt 0) { $logArgs += "--tail", $Lines }

        npm test            

    }            if ($logArgs.Count -gt 0) {

    "dev" {                docker logs @logArgs $containerName

        Write-Header "Starting development server"            } else {

        Write-Host "💡 Development server will run on http://localhost:4200" -ForegroundColor Yellow                docker logs $containerName

        npm start            }

    }        } else {

    "build" {            Write-Host "❌ Container not found" -ForegroundColor Red

        Write-Header "Building Angular application"        }

        npm run build    }

        if ($LASTEXITCODE -eq 0) {    

            Write-Host "✅ Build completed successfully" -ForegroundColor Green    "shell" {

        } else {        Write-Header "Opening container shell"

            Write-Host "❌ Build failed" -ForegroundColor Red        if (Test-ContainerRunning) {

        }            Write-Host "💡 Type 'exit' to leave the shell" -ForegroundColor Yellow

    }            docker exec -it $containerName /bin/sh

    "status" {        } else {

        Write-Header "Checking application status"            Write-Host "❌ Container is not running" -ForegroundColor Red

        .\status.ps1            Write-Host "   Start it first with: .\dev.ps1 start" -ForegroundColor Gray

    }        }

    default {    }

        Write-Host "❌ Unknown action: $Action" -ForegroundColor Red    

        Write-Host "Run '.\dev.ps1 -Help' for usage information" -ForegroundColor Yellow    "test" {

    }        Write-Header "Running tests"

}        npm test
    }
    
    "dev" {
        Write-Header "Starting development server"
        Write-Host "💡 Development server will run on http://localhost:4200" -ForegroundColor Yellow
        Write-Host "💡 Press Ctrl+C to stop" -ForegroundColor Yellow
        npm start
    }
    
    "build" {
        Write-Header "Building Angular application"
        npm run build
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Build completed successfully" -ForegroundColor Green
            Write-Host "📁 Output: dist/restaurant-business/" -ForegroundColor Blue
        } else {
            Write-Host "❌ Build failed" -ForegroundColor Red
        }
    }
    
    "status" {
        Write-Header "Checking application status"
        .\status.ps1
    }
    
    default {
        Write-Host "❌ Unknown action: $Action" -ForegroundColor Red
        Write-Host "Run '.\dev.ps1 -Help' for usage information" -ForegroundColor Yellow
    }
}