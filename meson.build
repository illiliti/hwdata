project(
  'hwdata',
  version: '0.0.0',
  meson_version: '>=0.45.0',
)

run_target(
  'update_ids',
  command: files('update_ids.sh'),
)

install_data(files('pnp.ids', 'pci.ids', 'usb.ids', 'oui.txt', 'iab.txt'))

pkgconfig = import('pkgconfig')
pkgconfig.generate(
  name: meson.project_name(),
  url: 'https://github.com/illiliti/hwdata',
  description: 'Hardware identification and configuration data',
  variables: [
    'datarootdir=' + '${prefix}' / get_option('datadir'),
    'pkgdatadir=' + '${datarootdir}' / meson.project_name(),
  ],
)
