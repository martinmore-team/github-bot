#!/bin/bash
if [[ -z "${PORT}" ]]; then
    PORT=9900
fi

if [[ -z "${WORKERS}" ]]; then
    WORKERS=1
fi

if [[ -z "${LOG_LEVEL}" ]]; then
    LOG_LEVEL=info
fi

APPLICATION_ASGI=github_bot.asgi:fastapp
APPLICATION_TIMEOUT=30

echo "Running FastAPI App..."
echo "APPLICATION_ASGI: ${APPLICATION_ASGI}"
echo "APPLICATION_TIMEOUT: ${APPLICATION_TIMEOUT}"
echo "APPLICATION_PORT: ${PORT}"
echo "APPLICATION_WORKERS: ${WORKERS}"

gunicorn ${APPLICATION_ASGI} \
    --timeout ${APPLICATION_TIMEOUT} \
    --graceful-timeout 30 \
    --access-logfile - \
    --error-logfile - \
    --log-level ${LOG_LEVEL} \
    --worker-class=uvicorn.workers.UvicornWorker \
    --workers=${WORKERS} \
    --bind=0.0.0.0:${PORT}
