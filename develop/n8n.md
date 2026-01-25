# Installing n8n Locally with Docker Compose

This guide provides step-by-step instructions for installing n8n locally on your computer using Docker Compose.

## Prerequisites

- Docker and Docker Compose installed on your system
- Basic familiarity with command line operations
- At least 2GB of free disk space

## Step 1: Create Project Directory

Create a directory for your n8n installation:

```bash
mkdir -p ~/n8n
cd ~/n8n
```

## Step 2: Create Directory Structure

Create the necessary directories for n8n data persistence:

```bash
mkdir -p data
mkdir -p .n8n
```

## Step 3: Create Docker Compose File

Create a `docker-compose.yml` file in your project directory:

```bash
touch docker-compose.yml
```

Add the following content to `docker-compose.yml`:

```yaml
version: '3.8'

services:
  n8n:
    image: n8nio/n8n:latest
    container_name: n8n
    restart: unless-stopped
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=${N8N_BASIC_AUTH_USER}
      - N8N_BASIC_AUTH_PASSWORD=${N8N_BASIC_AUTH_PASSWORD}
      - N8N_HOST=${N8N_HOST}
      - N8N_PORT=5678
      - N8N_PROTOCOL=${N8N_PROTOCOL}
      - WEBHOOK_URL=${WEBHOOK_URL}
      - GENERIC_TIMEZONE=${GENERIC_TIMEZONE}
      - TZ=${TZ}
      - N8N_METRICS=${N8N_METRICS}
      - N8N_LOG_LEVEL=${N8N_LOG_LEVEL}
      - N8N_USER_FOLDER=${N8N_USER_FOLDER}
      - DB_TYPE=${DB_TYPE}
      - DB_POSTGRESDB_HOST=${DB_POSTGRESDB_HOST}
      - DB_POSTGRESDB_PORT=${DB_POSTGRESDB_PORT}
      - DB_POSTGRESDB_DATABASE=${DB_POSTGRESDB_DATABASE}
      - DB_POSTGRESDB_USER=${DB_POSTGRESDB_USER}
      - DB_POSTGRESDB_PASSWORD=${DB_POSTGRESDB_PASSWORD}
      - EXECUTIONS_DATA_PRUNE=${EXECUTIONS_DATA_PRUNE}
      - EXECUTIONS_DATA_MAX_AGE=${EXECUTIONS_DATA_MAX_AGE}
    volumes:
      - ${N8N_DATA_PATH}:/home/node/.n8n
      - ${N8N_USER_DATA_PATH}:/data
    networks:
      - n8n-network
    depends_on:
      - postgres
    healthcheck:
      test: ["CMD", "wget", "--spider", "-q", "http://localhost:5678/healthz"]
      interval: 30s
      timeout: 10s
      retries: 3
      start_period: 40s

  postgres:
    image: postgres:15-alpine
    container_name: n8n-postgres
    restart: unless-stopped
    environment:
      - POSTGRES_USER=${DB_POSTGRESDB_USER}
      - POSTGRES_PASSWORD=${DB_POSTGRESDB_PASSWORD}
      - POSTGRES_DB=${DB_POSTGRESDB_DATABASE}
    volumes:
      - ${POSTGRES_DATA_PATH}:/var/lib/postgresql/data
    networks:
      - n8n-network
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U ${DB_POSTGRESDB_USER}"]
      interval: 10s
      timeout: 5s
      retries: 5

networks:
  n8n-network:
    driver: bridge
```

## Step 4: Create Environment File

Create a `.env` file in your project directory:

```bash
touch .env
```

Add the following content to `.env`. **Important:** Replace the placeholder values with your actual configuration:

```bash
# ============================================
# n8n Configuration
# ============================================

# Basic Authentication
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=changeme_secure_password_here

# Server Configuration
N8N_HOST=localhost
N8N_PORT=5678
N8N_PROTOCOL=http

# Webhook URL (for webhooks to work properly)
WEBHOOK_URL=http://localhost:5678/

# Timezone
GENERIC_TIMEZONE=Asia/Jerusalem
TZ=Asia/Jerusalem

# Metrics (set to true to enable metrics endpoint)
N8N_METRICS=false

# Logging
N8N_LOG_LEVEL=info

# User Data Folder (inside container - used by n8n internally)
N8N_USER_FOLDER=/data

# ============================================
# Database Configuration
# ============================================

# Database Type
DB_TYPE=postgresdb

# PostgreSQL Connection
DB_POSTGRESDB_HOST=postgres
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=changeme_database_password_here

# ============================================
# Data Persistence Paths
# ============================================

# n8n Data Directory (absolute path on host)
N8N_DATA_PATH=/Users/username/n8n/.n8n

# n8n User Data Directory (absolute path on host - mounted to /data in container)
N8N_USER_DATA_PATH=/Users/username/n8n/data

# PostgreSQL Data Directory (absolute path on host)
POSTGRES_DATA_PATH=/Users/username/n8n/postgres-data

# ============================================
# Execution Data Management
# ============================================

# Enable automatic pruning of execution data
EXECUTIONS_DATA_PRUNE=true

# Maximum age of execution data in hours (e.g., 168 = 7 days)
EXECUTIONS_DATA_MAX_AGE=168
```

### Environment Variables Explanation

#### Authentication
- `N8N_BASIC_AUTH_USER`: Username for accessing n8n web interface
- `N8N_BASIC_AUTH_PASSWORD`: Password for accessing n8n web interface

#### Server Settings
- `N8N_HOST`: Hostname where n8n will be accessible (use `localhost` for local installation)
- `N8N_PROTOCOL`: Protocol to use (`http` for local, `https` for production)
- `WEBHOOK_URL`: Base URL for webhooks (important for webhook nodes)

#### Timezone
- `GENERIC_TIMEZONE`: IANA timezone identifier (e.g., `Asia/Jerusalem`, `Europe/London`, `America/New_York`) used by n8n's schedule nodes for cron scheduling
- `TZ`: System timezone identifier (should match `GENERIC_TIMEZONE`) for consistent time handling

#### Database
- `DB_POSTGRESDB_USER`: PostgreSQL username
- `DB_POSTGRESDB_PASSWORD`: PostgreSQL password (change this!)
- `DB_POSTGRESDB_DATABASE`: Database name

#### Paths
- `N8N_DATA_PATH`: Absolute path on host where n8n will store workflows, credentials, and settings (mounted to `/home/node/.n8n` in container)
- `N8N_USER_DATA_PATH`: Absolute path on host for user data directory (mounted to `/data` in container)
- `N8N_USER_FOLDER`: Container path where n8n stores user data (set to `/data` - this is the path inside the container, not on the host)
- `POSTGRES_DATA_PATH`: Absolute path on host where PostgreSQL will store its data

**Important:** `N8N_USER_FOLDER` is the container path (always `/data`), while `N8N_USER_DATA_PATH` is the host path that gets mounted to `/data` in the container. These are different variables serving different purposes.

**Note:** Update the paths in the `.env` file to match your actual directory structure. The example uses `/Users/username/n8n/` - adjust this to your actual path.

## Step 5: Update Paths in .env File

Edit the `.env` file and update the following paths to match your system:

1. Replace `/Users/username/n8n/.n8n` with your actual n8n data path
2. Replace `/Users/username/n8n/data` with your actual n8n user data path
3. Replace `/Users/username/n8n/postgres-data` with your actual PostgreSQL data path
4. Change the passwords (`N8N_BASIC_AUTH_PASSWORD` and `DB_POSTGRESDB_PASSWORD`) to secure values
5. Update `GENERIC_TIMEZONE` and `TZ` if you're not in the Asia/Jerusalem timezone

For example, if your project is in `~/n8n`:

```bash
N8N_DATA_PATH=/Users/username/n8n/.n8n
N8N_USER_DATA_PATH=/Users/username/n8n/data
POSTGRES_DATA_PATH=/Users/username/n8n/postgres-data
```

## Step 6: Create PostgreSQL Data Directory

Create the PostgreSQL data directory:

```bash
mkdir -p postgres-data
```

## Step 7: Start n8n

Start the containers using Docker Compose:

```bash
docker-compose up -d
```

The `-d` flag runs the containers in detached mode (in the background).

## Step 8: Verify Installation

Check that the containers are running:

```bash
docker-compose ps
```

You should see both `n8n` and `n8n-postgres` containers with status "Up".

View the logs to ensure everything started correctly:

```bash
docker-compose logs -f n8n
```

Press `Ctrl+C` to exit the log view.

## Step 9: Access n8n

Open your web browser and navigate to:

```
http://localhost:5678
```

You will be prompted to log in using the credentials you set in the `.env` file:
- Username: (value of `N8N_BASIC_AUTH_USER`)
- Password: (value of `N8N_BASIC_AUTH_PASSWORD`)

## Step 10: Initial Setup

1. On first access, you'll be prompted to create your first user account
2. Fill in your details and create the account
3. You're now ready to start creating workflows!

## Useful Commands

### Stop n8n

```bash
docker-compose down
```

### Stop and Remove Volumes (⚠️ This deletes all data!)

```bash
docker-compose down -v
```

### View Logs

```bash
# All services
docker-compose logs -f

# Only n8n
docker-compose logs -f n8n

# Only PostgreSQL
docker-compose logs -f postgres
```

### Restart n8n

```bash
docker-compose restart n8n
```

### Update n8n to Latest Version

```bash
docker-compose pull
docker-compose up -d
```

### Backup Data

```bash
# Backup n8n data
tar -czf n8n-backup-$(date +%Y%m%d).tar.gz .n8n/

# Backup PostgreSQL data
tar -czf postgres-backup-$(date +%Y%m%d).tar.gz postgres-data/
```

## Troubleshooting

### Port Already in Use

If port 5678 is already in use, change it in both `docker-compose.yml` and `.env`:

In `docker-compose.yml`:
```yaml
ports:
  - "5679:5678"  # Change 5678 to 5679 (or another port)
```

In `.env`:
```bash
N8N_PORT=5679
WEBHOOK_URL=http://localhost:5679/
```

### Permission Issues

If you encounter permission issues with data directories:

```bash
# Fix permissions for n8n data directory
sudo chown -R 1000:1000 .n8n

# Fix permissions for PostgreSQL data directory
sudo chown -R 999:999 postgres-data
```

### Database Connection Issues

If n8n cannot connect to PostgreSQL:

1. Check that PostgreSQL container is running: `docker-compose ps`
2. Check PostgreSQL logs: `docker-compose logs postgres`
3. Verify database credentials in `.env` file match in both services

### Volume Mount Issues

If you encounter errors about paths not being shared (common on macOS):

1. Ensure all paths in your `.env` file are absolute paths (not relative)
2. Make sure the directories exist before starting Docker Compose
3. On macOS, ensure Docker Desktop has access to the directories (Docker Desktop → Settings → Resources → File Sharing)
4. Verify that `N8N_USER_DATA_PATH` points to a valid host directory, not a container path

### Reset Everything

To start fresh (⚠️ This deletes all data):

```bash
docker-compose down -v
rm -rf .n8n data postgres-data
mkdir -p .n8n data postgres-data
docker-compose up -d
```

## Docker Networking: Accessing Local and External Services

### Overview

The n8n container can access both:
- **External services** (internet): APIs, cloud services, external LLMs, etc.
- **Services on your host machine**: Local LLMs, databases, APIs running on your computer

### Accessing External Services

By default, Docker containers have internet access. You can use n8n nodes (HTTP Request, OpenAI, etc.) to connect to external services using their public URLs:

- External APIs: `https://api.example.com`
- Cloud LLMs: `https://api.openai.com`, `https://api.anthropic.com`
- Any public service on the internet

### Accessing Services on Your Host Machine

To access services running on your host machine (like local LLMs), you need to use a special hostname instead of `localhost` or `127.0.0.1`.

#### On macOS and Windows (Docker Desktop)

Use `host.docker.internal` to access services on your host machine:

**Example: Accessing a local LLM server**

If you're running a local LLM server on your host at `http://localhost:8080` (e.g., using llama-server), configure n8n to access it as:

```
http://host.docker.internal:8080
```

**Example: Accessing other local services**

- Local database on port 5432: `host.docker.internal:5432`
- Local API on port 3000: `http://host.docker.internal:3000`
- Local webhook receiver: `http://host.docker.internal:5000`

#### On Linux

On Linux, `host.docker.internal` may not be available by default. You have two options:

1. **Use the host's IP address**: Find your host's IP and use it directly
   ```bash
   # Find your host IP (usually the Docker bridge gateway)
   ip addr show docker0 | grep inet
   # Or use
   hostname -I | awk '{print $1}'
   ```

2. **Add extra_hosts to docker-compose.yml**:
   ```yaml
   services:
     n8n:
       # ... other configuration ...
       extra_hosts:
         - "host.docker.internal:host-gateway"
   ```

### Example: Connecting n8n to a Local LLM

If you're running a local LLM server (like llama-server, Ollama, or LM Studio) on your host:

1. **Start your local LLM server** on your host machine (e.g., on port 8080)

2. **In n8n workflows**, use the HTTP Request node with:
   - **URL**: `http://host.docker.internal:8080/v1/chat/completions` (or your LLM's endpoint)
   - **Method**: POST
   - **Headers**: `Content-Type: application/json`
   - **Body**: Your LLM request payload

3. **Example HTTP Request node configuration**:
   ```json
   {
     "method": "POST",
     "url": "http://host.docker.internal:8080/v1/chat/completions",
     "headers": {
       "Content-Type": "application/json"
     },
     "body": {
       "model": "your-model",
       "messages": [
         {
           "role": "user",
           "content": "{{ $json.message }}"
         }
       ]
     }
   }
   ```

### Testing Connectivity

You can test if n8n can reach your host services by:

1. **Using the HTTP Request node** in n8n to make a test request to `http://host.docker.internal:YOUR_PORT`
2. **Checking container logs** if connections fail: `docker-compose logs n8n`
3. **Using exec to test from inside the container**:
   ```bash
   docker exec -it n8n wget -O- http://host.docker.internal:8080
   ```

### Important Notes

- **Firewall**: Ensure your host machine's firewall allows connections from Docker containers
- **Service binding**: Your local service must be bound to `0.0.0.0` or `*`, not just `127.0.0.1`, to accept connections from Docker
- **Port availability**: Make sure the ports you're trying to access are not blocked
- **Network isolation**: The n8n container is on the `n8n-network` bridge network, which has internet access and can reach the host via `host.docker.internal`

### Troubleshooting Network Issues

If you can't connect to a local service:

1. **Verify the service is running**: Check that your local LLM/service is actually running and accessible from your host
2. **Check the port**: Ensure you're using the correct port number
3. **Test from host**: Try accessing the service from your host machine first: `curl http://localhost:8080`
4. **Check Docker network**: Verify the container can reach the host:
   ```bash
   docker exec -it n8n ping -c 2 host.docker.internal
   ```
5. **Check service binding**: Ensure your service listens on `0.0.0.0`, not just `127.0.0.1`

## Security Recommendations

1. **Change Default Passwords**: Always change the default passwords in the `.env` file
2. **Use HTTPS in Production**: Change `N8N_PROTOCOL` to `https` and configure SSL certificates
3. **Restrict Access**: Use a reverse proxy (nginx, Traefik) with authentication for production deployments
4. **Regular Backups**: Set up automated backups of your `.n8n` and `postgres-data` directories
5. **Keep Updated**: Regularly update n8n to the latest version: `docker-compose pull && docker-compose up -d`

## Additional Configuration Options

For more advanced configuration, you can add additional environment variables to your `.env` file. Refer to the [n8n documentation](https://docs.n8n.io/hosting/configuration/environment-variables/) for a complete list of available options.

Some useful additional options:

```bash
# Enable encryption for credentials
N8N_ENCRYPTION_KEY=your-encryption-key-here

# Set execution timeout
EXECUTIONS_TIMEOUT=3600

# Enable workflow sharing
N8N_PERSONALIZATION_ENABLED=true
```

## Next Steps

- Explore the [n8n documentation](https://docs.n8n.io/)
- Check out [n8n community workflows](https://n8n.io/workflows/)
- Learn about [n8n nodes](https://docs.n8n.io/integrations/) and their capabilities
