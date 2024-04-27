teapot_sources = [
  'main.vala',
]

teapot_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
]

executable('teapot', teapot_sources,
  vala_args: '--target-glib=2.58',  dependencies: teapot_deps,
  install: true,
)

