#!/usr/bin/env python3
import math

r_hour = 20
r_min = 30
orig_x = 50
orig_y = 50


def get_coord(r, rad):
    return orig_x + r * math.sin(rad), orig_y - r * math.cos(rad)


def get_mh_coord(min):
    rad = math.radians(min * 6)
    x, y = get_coord(r_min, rad)
    return round(x), round(y)


def get_hh_coord(hour, min):
    rad_hour = math.radians(hour * 30 + min / 2)
    x, y = get_coord(r_hour, rad_hour)
    return round(x), round(y)


def draw(x_mh, y_mh, x_hh, y_hh):
    svg = f"""
<svg width="100" height="100" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
    <!-- Clock Circle -->
    <circle cx="{orig_x}" cy="{orig_y}" r="45" stroke="black" stroke-width="5" fill="white"/>
    
    <!-- Clock Center -->
    <circle cx="{orig_x}" cy="{orig_y}" r="3" fill="black"/>
    
    <!-- Hour Hand -->
    <line x1="{orig_x}" y1="{orig_y}" x2="{x_hh}" y2="{y_hh}" stroke="black" stroke-width="4" stroke-linecap="round"/>
    
    <!-- Minute Hand -->
    <line x1="{orig_x}" y1="{orig_y}" x2="{x_mh}" y2="{y_mh}" stroke="black" stroke-width="3" stroke-linecap="round"/>
</svg>
    """
    return svg


def generate(hour, min):
    x_mh, y_mh = get_mh_coord(min)
    x_hh, y_hh = get_hh_coord(hour, min)
    svg = draw(x_mh, y_mh, x_hh, y_hh)
    with open(f"{hour}-{min}.svg", "w") as f:
        f.write(svg)


if __name__ == "__main__":
    for i in range(0, 12):
        for j in range(0, 60):
            print(f"gen {i}:{j}")
            generate(i, j)
