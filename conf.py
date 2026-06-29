# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'Simplifier.net'
copyright = '2026, Firely'
author = 'Firely'

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.intersphinx',
    'sphinx_reredirects',
]

intersphinx_mapping = {
    'main_docs': ('https://docs.fire.ly', None),
    'firely_terminal_docs': ('https://docs.fire.ly/projects/Firely-Terminal/', None),
    'forge_docs': ('https://docs.fire.ly/projects/Forge/', None),
    'firely_net_sdk_docs': ('https://docs.fire.ly/projects/Firely-NET-SDK/en/latest/', None),
    'firely_server_docs': ('https://docs.fire.ly/projects/Firely-Server/en/latest/', None)
    }

# -- Redirects for the docs restructure (sphinx-reredirects) ----------------
# Maps OLD docname (deleted/moved) -> NEW docname (no .rst, no .html).
# Relative redirect URLs are computed below so we don't hand-count "../".
import posixpath

_redirect_moves = {
    # --- git-detected renames (high confidence) ---
    "features/YAMLGen": "features/yamlgen/yamlgenplayground",
    "features/simplifierFQL": "features/fql/simplifierFQLPlayground",
    "features/api": "adding_content/api",
    "features/simplifierPlantUML": "implementation_guide/simplifierPlantUML",
    "data_governance_and_quality_control/simplifierForgeIntegration": "adding_content/forge",
    "data_governance_and_quality_control/simplifierGithub": "adding_content/github",
    "data_governance_and_quality_control/simplifierBrowse": "getting_started/simplifierBrowse",
    "data_governance_and_quality_control/simplifierPackages": "package_releases/simplifierPackages",
    "data_governance_and_quality_control/simplifierPackageCreationCheck": "package_releases/simplifierPackageCreationCheck",
    "data_governance_and_quality_control/simplifierPackageFeeds": "package_releases/package_feeds/getting-started",
    "data_governance_and_quality_control/simplifierPackageFeedsTechnicalReference": "package_releases/package_feeds/technical-reference",
    "data_governance_and_quality_control/simplifierQualityControl": "quality_control/quality_control",

    # --- mapped by hand from content (LOWER confidence — review these) ---
    # Section landing page was dissolved; pointing at the closest successor.
    "data_governance_and_quality_control/data_governance_and_quality_control": "package_releases/package_releases",
    "data_governance_and_quality_control/simplifierCanonicalClaims": "getting_started/simplifierProjects.html#canonical-claims",

}

redirects = {}
for old, new in _redirect_moves.items():
    # A target may carry an anchor (e.g. "page.html#section"); split it off so
    # the relative path is computed on the docname only and ".html" isn't
    # appended after the fragment.
    doc, sep, frag = new.partition("#")
    if doc.endswith(".html"):
        doc = doc[:-len(".html")]
    target = posixpath.relpath(doc, posixpath.dirname(old)) + ".html"
    redirects[old] = target + (sep + frag if frag else "")

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'develop']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
# html_theme = 'alabaster'
html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

master_doc = 'index'
html_theme_options = {'navigation_depth': -1}

# FQL has no dedicated Pygments lexer; we highlight it as 'sql' (best keyword/string
# coverage). FQL's JSON-like '{ }' select blocks can't be fully parsed and fall back to
# relaxed highlighting - suppress that non-fatal warning class so builds stay clean.
suppress_warnings = ['misc.highlighting_failure']
