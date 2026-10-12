# Assume your Takeout zips are in ~/Downloads/takeout
immich-go upload from-google-photos \
  --server=http://localhost:2283 \
  --api-key=your-api-key-here \
  ~/Downloads/takeout/takeout-*.zip
