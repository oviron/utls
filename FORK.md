# oviron/utls

Fork of [metacubex/utls](https://github.com/MetaCubeX/utls) for
[oviron/mihomo](https://github.com/oviron/mihomo). The module path stays
`github.com/metacubex/utls`, so consumers pull it in with a `replace` directive.

Branch `oviron` = MetaCubeX branch `v1.9.0-mod-meta` plus:

- `HelloFirefox_158`, and `HelloFirefox_Auto` pointing at it
  (refraction-networking/utls#427). It matches the Firefox 158 capture in
  `testdata/firefox158_clienthello.{hex,md}` field by field.
- A 240-byte GREASE ECH payload for Firefox 158, as Firefox 155+ sends (NSS 3.127).
- `HelloChrome_155` from refraction-networking/utls master (6ebdceb, verified
  against a fresh Chrome 155 capture in `testdata/chrome155_clienthello.{hex,md}`).
  `HelloChrome_Auto` stays Chrome 133. This base has no ML-DSA, so the ML-DSA
  codepoints are declared only to be offered in signature_algorithms, and the
  upstream ML-DSA handshake test is dropped.
- Every classical key share keeps its private key, so a server that picks P-256
  over X25519 still completes the handshake (refraction-networking/utls#433).
- `github.com/klauspost/compress` v1.20.4 instead of v1.17.9: before v1.20.2 a
  crafted zstd stream panics the decoder on its own goroutine
  ([GHSA-fpmh-frq8-7rj8](https://github.com/klauspost/compress/security/advisories/GHSA-fpmh-frq8-7rj8)),
  and this package decompresses zstd-compressed certificates, which Firefox 158
  offers. v1.20.4 needs Go 1.25, so the `go` line goes from 1.20 to 1.25.

`HelloChrome_Auto` (Chrome 133) and `HelloFirefox_120` are unchanged from the base.

Branch `oviron-refraction` carries the same changes on
[refraction-networking/utls](https://github.com/refraction-networking/utls) for
consumers of that module (Xray in [oviron/Throne](https://github.com/oviron/Throne)).

Tags: `v<base>-oviron.<n>`, for example `v1.9.0-oviron.1`. To move to a new base,
rebase `oviron` onto it, run `go test ./...`, tag the next number, and drop the
picks that upstream has merged.
