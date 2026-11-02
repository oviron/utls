# oviron/utls, branch `oviron-refraction`

Fork of [refraction-networking/utls](https://github.com/refraction-networking/utls)
for [oviron/Throne](https://github.com/oviron/Throne), whose Xray core imports this
module. The module path stays `github.com/refraction-networking/utls`, so consumers
pull it in with a `replace` directive.

Branch `oviron-refraction` = upstream `master` (`ff1b50f`, past v1.8.2) plus:

- `HelloFirefox_158`, and `HelloFirefox_Auto` pointing at it
  (refraction-networking/utls#427). It matches the Firefox 158 capture in
  `testdata/firefox158_clienthello.{hex,md}` field by field.
- A 240-byte GREASE ECH payload for Firefox 158, as Firefox 155+ sends (NSS 3.127).
- Every classical key share keeps its private key, so a server that picks P-256
  over X25519 still completes the handshake (refraction-networking/utls#433).

`HelloChrome_Auto` is Chrome 155 on this base, as in upstream `master`;
`HelloFirefox_120` is unchanged.

Branch `oviron` carries the same changes on metacubex/utls for consumers of that
module (mihomo, sing-box).

Tags: `v1.8.3-refraction.<n>`, after the version Go gives commits past v1.8.2
(`v1.8.3-0.<date>-<hash>`). To move to a newer upstream `master`, rebase the
branch onto it, run `go test ./...`, tag the next number, and drop the picks that
upstream has merged.
