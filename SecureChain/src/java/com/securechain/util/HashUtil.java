// file: src/main/java/com/securechain/util/HashUtil.java
package com.securechain.util;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashUtil {

    private static final String HASH_ALGORITHM = "SHA-256";

    /**
     * Calculates the SHA-256 hash of a file from its InputStream.
     *
     * @param is The InputStream of the file.
     * @return The hexadecimal string representation of the hash.
     * @throws NoSuchAlgorithmException If SHA-256 is not a supported algorithm.
     * @throws IOException If an I/O error occurs while reading the stream.
     */
    public static String getSHA256Hash(InputStream is) throws NoSuchAlgorithmException, IOException {
        MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
        byte[] byteArray = new byte[8192];
        int bytesCount;
        while ((bytesCount = is.read(byteArray)) != -1) {
            digest.update(byteArray, 0, bytesCount);
        }
        byte[] bytes = digest.digest();
        StringBuilder sb = new StringBuilder();
        for (byte aByte : bytes) {
            sb.append(String.format("%02x", aByte));
        }
        return sb.toString();
    }
}