# AI Voice Assistant with Docker

This repository combines multiple services to create a Tutoring AI voice assistant using Docker. The setup consists of four services:

1. **Ollama**: Pulls and serves the `nomic-embed-text` model.
2. **Frontend Agent**: Runs the Next.js frontend for the AI voice assistant.
3. **Python Worker**: Manages the voice agent and communicates via WebSocket.
4. **Streamlit Document Loader**: Provides a frontend to create document embeddings in a database, which can later be used as context for AI during real-time voice conversations.

## Services Overview

- **Ollama**
  - **Port**: 11434
  - **Description**: Serves the `nomic-embed-text` model.

- **Frontend Agent**
  - **Port**: 3000
  - **Description**: User interface for the AI voice assistant.

- **Python Worker**
  - **Port**: N/A (communicates via WebSocket)
  - **Description**: Runs the voice agent.

- **Streamlit Document Loader**
  - **Port**: 8501
  - **Description**: UI for creating document embeddings.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- Docker
- Docker Compose

Run the following command on Linux host to share clipboard with docker containers

```bash
xhost +local:docker
```


## Getting Started

### Clone the Repository

```bash
git clone https://github.com/Satti-Gowtham/Tutor_AI.git
cd tutor_ai
```

### Configuration

1. **Create a `.env` File**: Copy the example configuration file and fill in your keys and URLs.

    ```bash
    cp .env.example .env

2. **Fill in the `.env` File**: Open the `.env` file and replace the placeholders with your actual configuration values.

    ```dotenv
    # LiveKit API Configuration
    LIVEKIT_API_KEY=your_livekit_api_key_here
    LIVEKIT_API_SECRET=your_livekit_api_secret_here
    LIVEKIT_URL=your_livekit_url_here

    # Model Providers API Configuration
    GROQ_API_KEY=your_groq_api_key_here
    OPENAI_API_KEY=your_openai_api_key_here

    # Public Configuration
    NEXT_PUBLIC_LIVEKIT_URL=your_public_livekit_url_here
    OLLAMA_BASE_URL="http://host.docker.internal:11434"
    DISPLAY=${DISPLAY}

    DB_PATH=your_database_path_here

### Building and Running the Services

Use the provided `Makefile` to manage the Docker Compose setup.

1. **Pull the Repositories and Build the Docker Containers**:

    ```bash
    make all

2. **Start the Docker Containers**:

    ```bash
    make up

3. **Access the Services**:
    - **Ollama**: http://localhost:11434
    - **Frontend Agent**: http://localhost:3000
    - **Streamlit**: http://localhost:8501
    ```

### Viewing Logs

You can view logs for all containers or specific ones using the following commands:

- **View Logs for All Containers**:
    
    ```bash
    make logs

- **View Logs for Ollama**:

    ```bash
    make logs-ollama

- **View Logs for Frontend Agent**:

    ```bash
    make logs-frontend_agent

- **View Logs for Python Worker**:

    ```bash
    make logs-python_worker

- **View Logs for Streamlit**:

    ```bash
    make logs-streamlit
    ```

### Stopping the Services

To stop all running containers:

```bash
make stop
```

### Cleaning Up

To clean up all containers, volumes, and orphaned containers:

```bash
make clean
