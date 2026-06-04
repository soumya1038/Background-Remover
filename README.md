# U2-Net Background Remover

Standalone FastAPI service for removing image backgrounds with `rembg`/U2-Net. It is ready to push to GitHub and deploy on Render with Docker.

## Endpoints

- `GET /health` public Render health check.
- `POST /remove-background` protected by `x-api-key`.

`/remove-background` accepts either multipart form data:

```bash
curl -X POST https://your-service.onrender.com/remove-background \
  -H "x-api-key: YOUR_SECRET" \
  -F "image=@product.jpg" \
  --output product.png
```

Or JSON:

```bash
curl -X POST https://your-service.onrender.com/remove-background \
  -H "x-api-key: YOUR_SECRET" \
  -H "Content-Type: application/json" \
  -d "{\"imageUrl\":\"https://res.cloudinary.com/.../image.jpg\"}" \
  --output product.png
```

## Render

1. Push this folder to GitHub.
2. Create a Render Web Service from the repo.
3. Use Docker runtime or the included `render.yaml`.
4. Set `BG_REMOVER_API_KEY` to a long secret.
5. Keep `ALLOWED_IMAGE_HOSTS=res.cloudinary.com` unless you need more trusted hosts.
