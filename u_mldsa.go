package tls

// ML-DSA signature scheme codepoints (draft-ietf-tls-mldsa). This base has no
// ML-DSA support; the codepoints exist only so that HelloChrome_155 can offer
// them in signature_algorithms the way Chrome 155 does. A server that picks
// one of them fails the handshake as with any unsupported scheme.
const (
	MLDSA44 SignatureScheme = 0x0904
	MLDSA65 SignatureScheme = 0x0905
	MLDSA87 SignatureScheme = 0x0906
)
