# BunkerWeb - Multisite Applications Deployment

Deploy multiple applications (Open WebUI + Ollama, WordPress, Static Site) behind BunkerWeb security proxy using Docker Compose.

**Live Demos**:
- 🤖 **AI Chat**: https://ia.marcomelucci.me
- 📝 **WordPress**: https://wordpress.marcomelucci.me  
- 🌐 **Static Site**: https://staticpage.marcomelucci.me

## 🚀 Quick Start

### 1. Clone and Setup
```bash
git clone https://github.com/MarcoMelucci99/bunkerweb-multisite-applications.git
cd bunkerweb-multisite-applications
cp .env.example .env
```

### 2. Configure Environment
Edit `.env` file with your settings:
```bash
# Update domains to point to your public IP
DOMAIN_IA=your-ai-domain.com
DOMAIN_WORDPRESS=your-wp-domain.com
DOMAIN_STATIC=your-static-domain.com

# Set your email for Let's Encrypt
EMAIL_LETSENCRYPT=your-email@example.com

# Configure database passwords
MYSQL_ROOT_PASSWORD=your_secure_root_password
MYSQL_PASSWORD=your_secure_password

# Add your OpenAI API key (optional)
OPENAI_API_KEY=your_openai_api_key
```

### 3. Prepare Static Content
```bash
# Add your static website files to the static/ directory
echo "<h1>Welcome to my site!</h1>" > static/index.html
```

### 4. Start All Services
```bash
docker compose up -d
```

### 5. Enjoy! 😁

## 🛡️ Security Features (BunkerWeb)

- **Web Application Firewall (WAF)** with ModSecurity rules
- **Automatic SSL/TLS** certificates via Let's Encrypt
- **Rate limiting** and DDoS protection
- **Geo-blocking** (currently set to Italy only)
- **Bad behavior detection** and automatic banning
- **Reverse proxy** with WebSocket support for AI chat
- **Docker integration** for automatic configuration

## 🔧 Architecture

```
Internet → BunkerWeb (Port 80/443) → Internal Services
                    ├── Open WebUI + Ollama (AI Chat)
                    ├── WordPress + MariaDB
                    └── Static Nginx Site
```

## 📚 Available AI Models

Browse and download models from [Ollama Library](https://ollama.ai/library).
Current default model: `qwen2:0.5b` (lightweight for testing)

To change models:
1. Update `LLM_MODEL_VERSION` in `.env`
2. Or download directly from Open WebUI admin panel

## 🔒 Production Setup

### Domain Configuration
1. Point your domains to your server's public IP
2. Ensure ports 80 and 443 are open in your firewall
3. Wait for DNS propagation before starting containers

### Security Hardening
- Change all default passwords in `.env`
- Review BunkerWeb configuration in `docker-compose.yml`
- Monitor logs: `docker compose logs -f bunkerweb`

## 🐛 Troubleshooting

### Check Service Status
```bash
docker compose ps
docker compose logs [service-name]
```

### SSL Certificate Issues
```bash
# Check BunkerWeb logs for Let's Encrypt
docker compose logs bunkerweb | grep -i letsencrypt
```

### WebSocket Issues (AI Chat)
If AI chat streaming doesn't work, check:
- BunkerWeb WebSocket configuration
- Network connectivity between containers
- Browser console for WebSocket errors

## 👥 Development Team

**Developed by CyberHackademy GroupF:**

- 🔵 [@Marco Melucci](https://github.com/MarcoMelucci99)
- 🟢 [@Erasmo Prosciutto](https://github.com/CS-Era)
- 🟡 [@Daniele Degni](https://github.com/DennyDAkyX)
- 🟣 [@Luigi Maresca](https://github.com/luigii99)

---

**Powered By**: CyberHackademy Unina 🎓

## 📖 References

- [BunkerWeb Documentation](https://docs.bunkerweb.io/)
- [Open WebUI](https://github.com/open-webui/open-webui)
- [Ollama](https://github.com/ollama/ollama)
- [WordPress Docker](https://hub.docker.com/_/wordpress)
- [MariaDB](https://hub.docker.com/_/mariadb)
