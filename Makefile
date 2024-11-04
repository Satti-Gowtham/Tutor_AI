# Makefile for managing Docker Compose setup

# Define repository URLs
REPOS = \
    https://github.com/Satti-Gowtham/Ollama.git \
    https://github.com/Satti-Gowtham/Voice-Agent-Playground.git \
    https://github.com/Satti-Gowtham/Voice-Agent-Worker.git \
    https://github.com/Satti-Gowtham/Streamlit-Document-Loader.git

# Define directories for each service
OLLAMA_DIR = Ollama
FE_DIR = FE
WORKER_DIR = Worker
LOADER_DIR = Loader

# Define the default target
.PHONY: all
all: pull build up

# Pull the repositories
.PHONY: pull
pull:
	@echo "Pulling repositories..."
	@mkdir -p $(OLLAMA_DIR) $(FE_DIR) $(WORKER_DIR) $(LOADER_DIR)
	@for repo in $(REPOS); do \
		if [ "$$repo" = "https://github.com/Satti-Gowtham/Ollama.git" ]; then \
			git clone $$repo $(OLLAMA_DIR); \
		elif [ "$$repo" = "https://github.com/Satti-Gowtham/Voice-Agent-Playground.git" ]; then \
			git clone $$repo $(FE_DIR); \
		elif [ "$$repo" = "https://github.com/Satti-Gowtham/Voice-Agent-Worker.git" ]; then \
			git clone $$repo $(WORKER_DIR); \
		elif [ "$$repo" = "https://github.com/Satti-Gowtham/Streamlit-Document-Loader.git" ]; then \
			git clone $$repo $(LOADER_DIR); \
		fi \
	done

# Build the Docker containers
.PHONY: build
build:
	@echo "Building Docker containers..."
	docker compose build --no-cache

# Start the Docker containers
.PHONY: up
up:
	@echo "Starting Docker containers..."
	docker compose up -d

# View logs of the Docker containers
.PHONY: logs
logs:
	@echo "Viewing logs for all containers..."
	docker compose logs -f

# View logs for specific containers
.PHONY: logs-ollama
logs-ollama:
	@echo "Viewing logs for Ollama container..."
	docker compose logs -f ollama

.PHONY: logs-frontend_agent
logs-frontend_agent:
	@echo "Viewing logs for Frontend Agent container..."
	docker compose logs -f frontend_agent

.PHONY: logs-python_worker
logs-python_worker:
	@echo "Viewing logs for Python Worker container..."
	docker compose logs -f python_worker

.PHONY: logs-streamlit
logs-streamlit:
	@echo "Viewing logs for Streamlit Document Loader container..."
	docker compose logs -f streamlit

# Stop the Docker containers
.PHONY: stop
stop:
	@echo "Stopping Docker containers..."
	docker compose down

# Clean up by removing containers and networks
.PHONY: clean
clean:
	@echo "Cleaning up..."
	docker compose down --volumes --remove-orphans
