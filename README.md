# H5P.JoubelUICFRD 1.1

Capa CFRD sobre **H5P.JoubelUI** 1.3.45 (upstream), con `coreApi` **1.28**.

## Identidad H5P

| Campo | Valor |
|-------|-------|
| `machineName` | `H5P.JoubelUICFRD` |
| Versión | 1.1.0 |
| Entrada JS | `js/joubel-ui-cfrd.js` → `H5P.JoubelUICFRD` |
| Tipografía | `css/joubel-cfrd-fonts.css` + `fonts/poppins-v24-latin_latin-ext-regular.woff2` |

## Sync a Lumi / h5p-cli

```bash
npm run sync:lumi
```

Destino: `nuevas-librerias-h5p/H5P.JoubelUICFRD-1.1/`

## Fuente Poppins

Archivo auto-hospedado (subset latin + latin-ext, peso 400) desde [Fontsource](https://fontsource.org/fonts/poppins) / Google Fonts (OFL-1.1). Mismo nombre de archivo que usa `H5P.Instructions` para reutilizar copias entre librerías CFRD.

Documentación del stack: [docs/cfrd-migracion-1.0-a-1.1.md](../../../docs/cfrd-migracion-1.0-a-1.1.md).
