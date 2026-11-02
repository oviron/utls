# oviron/utls

Fork of [metacubex/utls](https://github.com/MetaCubeX/utls) for
[oviron/mihomo](https://github.com/oviron/mihomo). The module path stays
`github.com/metacubex/utls`, so consumers pull it in with a `replace` directive.

Branch `oviron` = MetaCubeX branch `v1.9.0-mod-meta` plus:

- `HelloFirefox_158`, and `HelloFirefox_Auto` pointing at it
  (refraction-networking/utls#427). It matches the Firefox 158 capture in
  `testdata/firefox158_clienthello.{hex,md}` field by field.
- A 240-byte GREASE ECH payload for Firefox 158, as Firefox 155+ sends (NSS 3.127).
- Every classical key share keeps its private key, so a server that picks P-256
  over X25519 still completes the handshake (refraction-networking/utls#433).

`HelloChrome_Auto` (Chrome 133) and `HelloFirefox_120` are unchanged from the base.

Branch `oviron-refraction` carries the same changes on
[refraction-networking/utls](https://github.com/refraction-networking/utls) for
consumers of that module (Xray in [oviron/Throne](https://github.com/oviron/Throne)).

Tags: `v<base>-oviron.<n>`, for example `v1.9.0-oviron.1`. To move to a new base,
rebase `oviron` onto it, run `go test ./...`, tag the next number, and drop the
picks that upstream has merged.
