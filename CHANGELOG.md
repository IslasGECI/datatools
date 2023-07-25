# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2023-07-25

We use this repo in [`janitor`](https://github.com/IslasGECI/janitor/blob/develop/geci_janitor/cli.py#L25). We mount the directory `results` to work with the output files.

### Added

- Description of the steps for data curation in README.

### Fixed

### Changed

- Now we save `socorro_cleaned_format.csv` in the directory `results/`
- Now we save `weekly_summary_socorro_cleaned_format.csv` in the directory `results/week_${week}.csv`

### Removed

