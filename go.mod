module github.com/metacubex/utls

go 1.25

retract (
	v1.4.1 // #218
	v1.4.0 // #218 panic on saveSessionTicket
)

require (
	github.com/andybalholm/brotli v1.0.6
	github.com/klauspost/compress v1.20.4 // GHSA-fpmh-frq8-7rj8: zstd panic before v1.20.2; needs go 1.25
	golang.org/x/crypto v0.33.0
	golang.org/x/exp v0.0.0-20240904232852-e7e105dedf7e
)

require golang.org/x/sys v0.30.0 // indirect
