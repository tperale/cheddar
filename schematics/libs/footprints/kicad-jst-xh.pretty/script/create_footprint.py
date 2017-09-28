import argparse
from collections import namedtuple

from jinja2 import Environment, PackageLoader

Rect = namedtuple("Rect", ["left", "top", "right", "bottom"])


def get_template_variables(pins):
    if pins == 2:
        drill = 1
    else:
        drill = 0.9
    offset = 0.5
    raster_width = 2.5
    pin_offset_y = 2.35
    pin_offset_x = 2.45
    width = pin_offset_x * 2 + (pins-1) * raster_width
    height = 5.75
    outline = Rect(-pin_offset_x, -pin_offset_y, width-pin_offset_x, height-pin_offset_y)
    crt = Rect(*(x+y for x, y in zip(outline, (-offset, -offset, offset, offset))))
    return dict(
        pins=pins,
        outline=outline,
        crt=crt,
        raster_width=raster_width,
        name="JST_B{}B-XH-A".format(pins),
        width=width,
        drill=drill,
    )


def main(pins):
    args = get_template_variables(pins)
    with open("../{}.kicad_mod".format(args["name"]), "w") as fo:
        env = Environment(loader=PackageLoader(__name__, '.'))
        env.get_template("kicad_mod.template").stream(**args).dump(fo)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='create footprints for jst xh')
    parser.add_argument('pins', type=int, help='number of pins')
    args = parser.parse_args()
    main(args.pins)
