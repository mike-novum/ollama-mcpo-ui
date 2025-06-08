# Ollama + OpenWebUI + MCPo

Simple docker-compose for running LLM locally.

1. Add your MCP-servers  to config.json. 

```json
{
  "mcpServers": {   
    "gitlab": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-gitlab"
      ],
      "env": {
        "GITLAB_PERSONAL_ACCESS_TOKEN": "yourtoken",
        "GITLAB_API_URL": "https://gitlab.com/api/v4"
      }
    }
  }
}
```

2. Run:

```sh
docker-compose up -d
```


3. Add model to ollama:

```sh
docker exec -it ollama ollama run qwen3:1.7b
```

List of models for ollama [here](https://ollama.com/search)


4. Open `localhost:3000` in browser

5. Add your MCP-server to OpenWebUI. Go to Settings->Tools. Press "plus" and add adress:

```
http://localhost:8000/gitlab
```
>If everything is done correctly, the available tools will be displayed in the chat with an icon

>mspo runs on port `8000`, if you specify a link to `localhost:8000` then the tools will not be available. You must add each MCP server manually according to the pattern `localhost:8000/{mcp_server_name}`

> `localhost:8000/server-name/docs` - openapi docs of your mcp server

> `localhost:8000/server-name/openapi.json` - openapi json


6. Done :)