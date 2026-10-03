package modmenu;

/**
 * Deterministic rotation of the spoofed device identities.
 *
 * The four values from spoof.env are baked into the patch as generation-0
 * constants; stepping the generation rewrites every alphanumeric character
 * while preserving its class, and letters stay inside the a-f hex alphabet,
 * so UUID-shaped values remain UUID-parseable and bare tokens stay hex.
 * Both directions (menu display and stub lookup) derive from the generation
 * alone, so no value is ever stored or duplicated.
 */
final class Hwid {
    private Hwid() {}

    static String rotate(String base, int gen) {
        if (gen == 0) {
            return base;
        }
        int hash = base.hashCode();
        StringBuilder sb = new StringBuilder(base.length());
        for (int i = 0; i < base.length(); i++) {
            char c = base.charAt(i);
            if (c >= '0' && c <= '9') {
                sb.append((char) ('0' + shift(c - '0', gen, hash, i, 10)));
            } else if (c >= 'a' && c <= 'f') {
                sb.append((char) ('a' + shift(c - 'a', gen, hash, i, 6)));
            } else if (c >= 'A' && c <= 'F') {
                sb.append((char) ('A' + shift(c - 'A', gen, hash, i, 6)));
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    // offset lands in [1, size-1], so the character always moves - the
    // rotated value can never equal the input for gen > 0.
    private static int shift(int idx, int gen, int hash, int pos, int size) {
        int off = (gen * 31 + hash + pos * 7) % (size - 1);
        if (off < 0) {
            off += size - 1;
        }
        return (idx + off + 1) % size;
    }
}
