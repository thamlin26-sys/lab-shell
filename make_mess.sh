#!/usr/bin/env bash
# Build a deliberately messy practice tree in the current directory.
# The script writes only beneath that directory and never deletes files.
set -eu

# The two strings you will hunt for are assembled from halves, so that this
# script itself never contains the literal text you grep for. That way
# `grep -rn ... .` finds them only in the files below -- even if you keep this
# script sitting in the folder while you work.
marker="TO"
marker="${marker}DO"
flag="FL"
flag="${flag}AG{aut0mate_the_b0ring_stuff}"

# --- folders -------------------------------------------------------------
mkdir -p src/data docs/archive webpage

# --- scattered homework (you will file these away) -----------------------
printf '%s\n' \
  "# hw1.py: warm-up exercises" \
  "def double(n):" \
  "    return n * 2" \
  "" \
  "# $marker: add a test for negative numbers" \
  "print(double(21))" > hw1.py

printf '%s\n' \
  "# hw2.py" \
  "def square(n):" \
  "    return n * n" \
  "" \
  "# $marker: reject non-integer input" \
  "print(square(9))" > hw2.py

printf '%s\n' \
  "# hw3.py" \
  "def is_even(n):" \
  "    return n % 2 == 0" \
  "" \
  "# $marker: what about negative numbers?" \
  "print(is_even(4))" > hw3.py

printf '%s\n' \
  "# hw10.py" \
  "def factorial(n):" \
  "    result = 1" \
  "    for i in range(2, n + 1):" \
  "        result = result * i" \
  "    return result" \
  "" \
  "print(factorial(5))" > hw10.py

# --- lab files (these stay put when you tidy) ----------------------------
printf '%s\n' \
  "# lab02.py" \
  "def greet(name):" \
  "    return 'hello, ' + name" \
  "" \
  "# $marker: strip whitespace from name" \
  "print(greet('world'))" > lab02.py

printf '%s\n' \
  "# lab03.py" \
  "def is_empty(s):" \
  "    # $marker: handle the empty string" \
  "    return len(s) == 0" \
  "" \
  "print(is_empty(''))" > lab03.py

printf '%s\n' \
  "# lab04.py" \
  "def add(a, b):" \
  "    return a + b" \
  "" \
  "print(add(2, 2))" > lab04.py

# --- odds and ends -------------------------------------------------------
printf '%s\n' \
  "Reminders" \
  "---------" \
  "- review the cleanup plan" \
  "# $marker: back up the repo before the demo" > notes.txt

printf '%s\n' \
  "# project" \
  "" \
  "some old code we keep meaning to clean up." > README.md

# --- nested source -------------------------------------------------------
printf '%s\n' \
  "# src/parse.py" \
  "def parse(line):" \
  "    # $marker: handle commas inside quotes" \
  "    return line.split(',')" > src/parse.py

printf '%s\n' \
  "# src/helpers.py" \
  "def clamp(x, lo, hi):" \
  "    return max(lo, min(x, hi))" > src/helpers.py

printf '%s\n' \
  "name,score" \
  "alice,95" \
  "bob,88" > src/data/sample.csv

# --- webpage (leftovers from an earlier project) -------------------------
printf '%s\n' \
  "<!doctype html>" \
  "<html><body><h1>hello</h1></body></html>" > webpage/index.html

printf '%s\n' \
  "body { font-family: sans-serif; }" > webpage/style.css

# --- docs, with something hidden deep inside -----------------------------
printf '%s\n' \
  "old readme, superseded." \
  "nothing important in this folder." > docs/README_old.txt

printf '%s\n' \
  "Field notes -- autumn 2019." \
  "The safehouse key is under the third flowerpot." \
  "$flag" \
  "Burn after reading." > docs/archive/fieldnotes.txt

# --- junk to be deleted --------------------------------------------------
printf '%s\n' "temporary build cache -- safe to delete" > cache.tmp
printf '%s\n' "intermediate build artifact" > build.tmp
printf '%s\n' "[info] started" "[info] finished" > debug.log
printf '%s\n' "[warn] retrying" "[error] gave up" > error.log

echo "Built a messy practice repo in: $(pwd)"
echo "Start by looking around with:  pwd  and  ls -a"
