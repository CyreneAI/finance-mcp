# mcp-servers/finance-mcp/Dockerfile
FROM ghcr.io/cyreneai/base-mcp:latest

# Set the working directory
WORKDIR /app

# Copy your service code
COPY server.py .

# Standard MCP port in Kubernetes
EXPOSE 9001

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "9001"]
