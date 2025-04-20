#!/bin/bash
sensors | grep CPU | grep -oE '[0-9]+\.[0-9]+'
