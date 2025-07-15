## 📈 Finance MCP

This repository contains the Finance MCP (Multi-Channel Platform) server, a specialized microservice within the Multi-Agent Bot system. Its purpose is to provide a suite of financial data retrieval tools via the FastMCP protocol, making them discoverable and invokable by the cyrene-agent (agent-api) service. This allows agents to access real-time and historical financial information.

## ✨ Features

- **Stock Quote Retrieval**: Get current stock prices for given tickers.  
- **Company Profile**: Retrieve detailed company information.  
- **Stock Metrics**: Access key financial metrics for a stock.  
- **Stock News**: Fetch recent news articles related to a specific stock.  
- **Market News**: Get general market news headlines.  
- **Stock Peers**: Find peer companies for a given stock.  
- **Stock Recommendations**: Get analyst recommendations.  
- **Market Status**: Check if stock markets are open or closed.  
- **Multiple Stocks**: Retrieve data for multiple stocks at once.  
- **Stock Search**: Search for stocks by name or keyword.  
- **FastMCP Integration**: Registers all financial functionalities as discoverable tools for the cyrene-agent.  
- **Modular & Scalable**: Runs as an independent microservice, allowing for easy scaling and maintenance.

## 🏛️ Architecture Context

The finance-mcp is one of several specialized MCP servers. It communicates with external financial data APIs (like Financial Modeling Prep - FMP) to perform its functions. The cyrene-agent discovers its tools via the fastmcp-core-server and then directly calls these tools on the finance-mcp service.


## 🚀 Getting Started

### Prerequisites

* Python 3.12+
* **Financial Modeling Prep (FMP) API Key**: Required for all financial tools. Obtain one from Financial Modeling Prep.

### Installation

Clone this repository:

```bash
git clone https://github.com/CyreneAI/finance-mcp.git
cd finance-mcp
```

> **Note:** If you are setting up the entire multi-repo system, you would typically clone the main orchestrator repository first.

Install Python dependencies:

```bash
pip install -r requirements.txt
```

### Environment Variables

Create a `.env` file in the root of this `finance-mcp` directory with the following variable:

```env
# .env in finance-mcp directory
FINNHUB_API_KEY="Your_API_KEY"
QUANDL_API_KEY="Your_API_KEY"
```

### Running the Application (Local Development)

Run the finance-mcp service using Uvicorn:

```bash
uvicorn server:app --reload --host 0.0.0.0 --port 9001
```

The finance-mcp server will be accessible at `http://localhost:9001`. It will automatically register its tools with the fastmcp-core-server if it's running and configured correctly.

## 🧪 Usage

Once the finance-mcp server is running and its tools are registered with fastmcp-core-server, the cyrene-agent can invoke its tools.

Example queries you can send to your agent (via the agent-UI or direct API chat) that would trigger finance-mcp tools:

* “What is the current stock price of AAPL?” (Uses `get_stock_quote`)
* “Tell me about the company profile of Microsoft.” (Uses `get_company_profile`)
* “What are the latest news headlines in the financial market?” (Uses `get_market_news`)
* “Is the stock market open right now?” (Uses `get_market_status`)

## 📁 Project Structure

```
finance-mcp/
├── .env.example
├── .gitignore
├── README.md           # <- This file
├── Dockerfile          # Dockerfile for the finance-mcp service
├── requirements.txt    # Python dependencies for finance-mcp
└── server.py           # FastAPI application for the finance-mcp
```
