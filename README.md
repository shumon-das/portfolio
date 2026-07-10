# Monoranjan Das Portfolio

A responsive single-page portfolio landing page for Monoranjan Das.

## Files

- `index.html` - page structure and content
- `styles.css` - responsive styling and animations
- `script.js` - scroll reveal behavior
- `assets/social-preview-placeholder.svg` - Open Graph preview placeholder

## Usage

Open `index.html` directly in a browser.

No build step or development server is required.

## Isolated deployment

This site can be served from an isolated Docker container with Caddy.
The app container itself uses host port `8085`.

1. Create an `A` record:

   ```text
   dev.bookspointer.com -> 147.93.18.51
   ```

2. Start the container on the server:

   ```bash
   docker compose up -d --build
   ```

3. Visit:

   ```text
   https://dev.bookspointer.com
   ```

DNS cannot map a hostname to a port. For `https://dev.bookspointer.com` without
`:8085`, the server still needs one edge service listening on ports `80` and
`443` and routing by hostname. That edge service can be containerized Caddy,
Traefik, or another existing reverse proxy; nginx does not need to be installed
on the host.

If another isolated project already owns port `80`, either:

- add this route to that existing edge/proxy service:

  ```caddyfile
  dev.bookspointer.com {
      reverse_proxy 127.0.0.1:8085
  }
  ```

- or move both projects behind one shared containerized edge proxy.

Without a shared edge proxy, the reachable URL is:

```text
http://147.93.18.51:8085
```
