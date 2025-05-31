echo "Converting csl-m"
mkdir -p generated-schemas/csl-m
find csl-m-schema -maxdepth 1 -name "*.rnc" | while read -r file; do
  base=$(basename "$file" .rnc)
  java -jar tools/trang.jar "$file" "generated-schemas/csl-m/$base.rng"
done

echo "Converting csl"
mkdir -p generated-schemas/csl
find csl-schema/schemas/styles -name "*.rnc" | while read -r file; do
  base=$(basename "$file" .rnc)
  java -jar tools/trang.jar "$file" "generated-schemas/csl/$base.rng"
done

echo "Merging"
mkdir -p generated-schemas/merged
cp -r generated-schemas/csl-m/*.rng generated-schemas/merged || true
cp -r generated-schemas/csl/*.rng generated-schemas/merged
