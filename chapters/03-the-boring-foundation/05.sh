cd /srv/lab/compose/<app>
docker compose up -d        # start (and download the image the first time)
docker compose logs -f      # watch what it's doing (Ctrl-C to stop watching)
docker compose down         # stop
