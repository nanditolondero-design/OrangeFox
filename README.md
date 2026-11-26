# OrangeFox para moto g51 5G (cypfq)

Estado: **sin probar**. Se armo a partir de tu boot.img, vendor_boot.img, vbmeta, dtbo y de los
arboles de LineageOS (sm6375-common + cypfq). Es muy probable que la primera compilacion pida
algun ajuste: pasame el `build.log` y lo corrijo.

## Como esta armado
- El recovery va en **boot** (header v3, igual que el de LineageOS). `vendor_boot` no se toca:
  ahi estan la dtb, la cmdline y los modulos (touch `ili9882_mmi`, cargador, etc.).
- Kernel: el 5.4.302 de tu propio boot.img (`device_tree/prebuilt/Image.gz`, se descomprime en el build).
- `recovery.fstab`: sale del fstab.qcom real de tu ROM (particiones logicas, f2fs, metadata).

## Compilar
1. Crear un repo en GitHub y subir TODO el contenido de esta carpeta (incluida `.github`).
2. Pestana **Actions** > **Build OrangeFox cypfq** > **Run workflow**.
3. Tarda varias horas. Al terminar, en el artefacto `orangefox-cypfq` estan
   `orangefox-cypfq-boot.img` y `build.log` (el log se sube aunque falle).

## Instalar (con el celular en fastboot)
1. Guardar tu `boot.img` original (el de tu ROM): es tu vuelta atras.
2. `fastboot flash boot orangefox-cypfq-boot.img`
3. Reiniciar a recovery (`adb reboot recovery` o desde el menu de fastboot).
4. Si Android no arranca despues: `fastboot flash boot boot.img` (el original).

Mantene el `vbmeta` que ya tenes (flags=3, verificacion desactivada).

## Limitaciones conocidas
- `/data` usa claves envueltas por hardware (`wrappedkey_v0`): probablemente no se descifre
  en la primera version; para eso hacen falta blobs de keymint/qseecomd de tu vendor.
- Los tamanos de `super` salen del arbol de fogo; si tu equipo difiere, ajustar en BoardConfig.mk.
- Rama de OrangeFox por defecto: 14.1 (se puede cambiar al correr el workflow).
