set -x

PINS=$1
FOLDER=../kicad-jst-xh.3dshapes/
mkdir -p $FOLDER
~/Code/openscad/openscad/_build/openscad -o /tmp/pins.stl -D r='"pins"' -D pins=$PINS JST_BXB-XH-A.scad
~/Code/openscad/openscad/_build/openscad -o /tmp/housing.stl -D r='"housing"' -D pins=$PINS JST_BXB-XH-A.scad
meshlabserver -i /tmp/pins.stl /tmp/housing.stl -o ${FOLDER}/JST_B${PINS}B-XH-A.wrl -om vc -s color_and_flat.mlx
