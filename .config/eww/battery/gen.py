#!/usr/bin/env python3

def draw(percent):
    svg = f"""
<svg xmlns="http://www.w3.org/2000/svg" width="114" height="54" viewBox="0 0 114 54">
  <!-- Battery Outline -->
  <rect x="1" y="1" width="100" height="50" rx="5" ry="5" stroke="white" fill="none" stroke-width="2"/>
  <!-- Battery Fill (variable percentage) -->
  <rect id="battery-fill" x="2" y="2" width="{percent}" height="50" rx="1" ry="1" fill="white"/>
  <!-- Battery Indicator -->
  <rect x="105" y="15" width="10" height="20" rx="3" ry="3" fill="white"/>
</svg>
    """
    return svg


def generate(percent):
    svg = draw(percent)
    with open(f"{percent}.svg", "w") as f:
        f.write(svg)


if __name__ == "__main__":
    for i in range(0, 101):
        generate(i)
