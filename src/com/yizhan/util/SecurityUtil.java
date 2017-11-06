package com.yizhan.util;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.AlgorithmParameterSpec;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.*;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class SecurityUtil {
	public static final int defaultKeyPairSize = 512;
	public static final SignatureAlgorithm DEFAULT_SIGNATURE_ALGORITHM = SignatureAlgorithm.SHA1WITHRSA;
	public static final char[] ALPHABET_A2Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
			.toCharArray();
	public static final char[] FULL_ALPHABET_WITH_NUMBER = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
			.toCharArray();
	private static KeyFactory rsaKf = null;
	private static byte[] encodeBase64Map = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"
			.getBytes();

	private static byte[] decodeBase64Map = new byte[256];
	private static Random random = new Random(new SecureRandom().nextLong());
	public static final char[] ALPHABET_58;
	private static final byte[] INDEXES_58;

	static {
		try {
			rsaKf = KeyFactory.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		for (int i = 0; i < decodeBase64Map.length; ++i) {
			decodeBase64Map[i] = -1;
		}
		for (int i = 0; i < encodeBase64Map.length; ++i) {
			decodeBase64Map[encodeBase64Map[i]] = (byte) i;
		}

		decodeBase64Map[43] = decodeBase64Map[45];
		decodeBase64Map[47] = decodeBase64Map[95];

		ALPHABET_58 = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
				.toCharArray();

		INDEXES_58 = new byte[128];

		for (int i = 0; i < INDEXES_58.length; ++i) {
			INDEXES_58[i] = -1;
		}
		for (int i = 0; i < ALPHABET_58.length; ++i)
			INDEXES_58[ALPHABET_58[i]] = (byte) i;
	}

	public static byte[] encrypt(byte[] key, byte[] data) {
		return encrypt(key, data, new byte[16]);
	}

	public static byte[] encryptTrunks(byte[] key, byte[] data) {
		return encryptTrunks(key, data, new byte[16]);
	}

	public static byte[] encryptTrunks(byte[] key, byte[] data, byte[] iv) {
		SecretKey sKey = new SecretKeySpec(key, "AES");
		AlgorithmParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		byte[] encrypt = null;
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
			cipher.init(1, sKey, ivParameterSpec);
			encrypt = cipher.doFinal(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		return encrypt;
	}

	public static byte[] encrypt(byte[] key, byte[] data, byte[] iv) {
		SecretKey sKey = new SecretKeySpec(key, "AES");
		AlgorithmParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		byte[] encrypt = null;
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(1, sKey, ivParameterSpec);
			encrypt = cipher.doFinal(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		return encrypt;
	}

	public static byte[] decrypt(byte[] key, byte[] encrypt) {
		return decrypt(key, encrypt, new byte[16]);
	}

	public static byte[] decryptTrunks(byte[] key, byte[] encrypt) {
		return decryptTrunks(key, encrypt, new byte[16]);
	}

	public static byte[] decrypt(byte[] key, byte[] decrypt, byte[] iv) {
		SecretKey sKey = new SecretKeySpec(key, "AES");
		AlgorithmParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		byte[] value = null;
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(2, sKey, ivParameterSpec);
			value = cipher.doFinal(decrypt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		return value;
	}

	public static byte[] decryptTrunks(byte[] key, byte[] decrypt, byte[] iv) {
		SecretKey sKey = new SecretKeySpec(key, "AES");
		AlgorithmParameterSpec ivParameterSpec = new IvParameterSpec(iv);
		byte[] value = null;
		try {
			Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
			cipher.init(2, sKey, ivParameterSpec);
			value = cipher.doFinal(decrypt);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		}
		return value;
	}

	public static PublicKey getPublicKeyFromBytes(byte[] pubKey) {
		PublicKey publicKey = null;
		try {
			publicKey = rsaKf.generatePublic(new X509EncodedKeySpec(pubKey));
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return publicKey;
	}

	public static PrivateKey getPrivateKeyFromBytes(byte[] priKey) {
		PrivateKey privateKey = null;
		try {
			privateKey = rsaKf.generatePrivate(new PKCS8EncodedKeySpec(priKey));
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return privateKey;
	}

	public static byte[] getBytesFromBase64(String base64String) {
		byte[] in = base64String.replaceAll("[\\r\\n=]", "").getBytes();
		int totalTrunk = in.length / 4;
		int outLength = totalTrunk * 3;
		if (in.length - (totalTrunk * 4) == 3)
			outLength += 2;
		else if (in.length - (totalTrunk * 4) == 2) {
			++outLength;
		}
		byte[] out = new byte[outLength];
		int outOffset = 0;
		int inOffset = 0;
		while (inOffset < totalTrunk * 4) {
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[inOffset])] << 2 | decodeBase64Map[(0xFF & in[(inOffset + 1)])] >>> 4);
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[(inOffset + 1)])] << 4 | decodeBase64Map[(0xFF & in[(inOffset + 2)])] >>> 2);
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[(inOffset + 2)])] << 6 | decodeBase64Map[(0xFF & in[(inOffset + 3)])]);
			inOffset += 4;
		}
		if (out.length - outOffset == 2) {
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[inOffset])] << 2 | decodeBase64Map[(0xFF & in[(inOffset + 1)])] >>> 4);
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[(inOffset + 1)])] << 4 | decodeBase64Map[(0xFF & in[(inOffset + 2)])] >>> 2);
		} else if (out.length - outOffset == 1) {
			out[(outOffset++)] = (byte) (decodeBase64Map[(0xFF & in[inOffset])] << 2 | decodeBase64Map[(0xFF & in[(inOffset + 1)])] >>> 4);
		}
		return out;
	}

	public static String getBase64FromBytes(byte[] data) {
		return getBase64FromBytes(data, true);
	}

	public static String getBase64FromBytes(byte[] data, boolean urlSafe) {
		int totalTrunk = data.length / 3;
		int outSize = data.length / 3 * 4;
		if (urlSafe) {
			if (data.length - (totalTrunk * 3) == 2)
				outSize += 3;
			else if (data.length - (totalTrunk * 3) == 1) {
				outSize += 2;
			}
		} else if (data.length - (totalTrunk * 3) > 0) {
			outSize += 4;
		}

		byte[] out = new byte[outSize];

		int offset = 0;
		int dataOffset = 0;
		while (dataOffset < totalTrunk * 3) {
			out[(offset++)] = encodeBase64Map[(data[dataOffset] >>> 2 & 0x3F)];
			out[(offset++)] = encodeBase64Map[((data[dataOffset] << 4 & 0x30 | data[(dataOffset + 1)] >>> 4 & 0xF) & 0x3F)];
			out[(offset++)] = encodeBase64Map[((data[(dataOffset + 1)] << 2 & 0x3C | data[(dataOffset + 2)] >>> 6 & 0x3) & 0x3F)];
			out[(offset++)] = encodeBase64Map[(data[(dataOffset + 2)] & 0x3F)];
			dataOffset += 3;
		}
		if (data.length - dataOffset == 1) {
			out[(offset++)] = encodeBase64Map[(data[dataOffset] >> 2 & 0x3F)];
			out[(offset++)] = encodeBase64Map[(data[dataOffset] << 4 & 0x3F)];
			if (!(urlSafe)) {
				out[(offset++)] = 61;
				out[(offset++)] = 61;
			}
		}
		if (data.length - dataOffset == 2) {
			out[(offset++)] = encodeBase64Map[(data[dataOffset] >> 2 & 0x3F)];
			out[(offset++)] = encodeBase64Map[((data[dataOffset] << 4 & 0x30 | data[(dataOffset + 1)] >>> 4 & 0xF) & 0x3F)];
			out[(offset++)] = encodeBase64Map[(data[(dataOffset + 1)] << 2 & 0x3F)];
			if (!(urlSafe)) {
				out[(offset++)] = 61;
			}
		}
		if (!(urlSafe)) {
			for (int i = 0; i < out.length; ++i) {
				if (out[i] == 45)
					out[i] = 43;
				else if (out[i] == 95) {
					out[i] = 47;
				}
			}
		}
		return new String(out);
	}

	public static KeyPair generateKeyPair() {
		return generateKeyPair(512);
	}

	public static KeyPair generateKeyPair(int keyPairSize) {
		KeyPairGenerator pairgen = null;
		try {
			pairgen = KeyPairGenerator.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		ByteBuffer bb = ByteBuffer.allocate(16);
		bb.putLong(System.currentTimeMillis());
		bb.putLong(Thread.currentThread().getId());
		SecureRandom random = new SecureRandom(bb.array());
		random.setSeed(System.currentTimeMillis());
		pairgen.initialize(keyPairSize, random);
		return pairgen.generateKeyPair();
	}

	public static byte[] encrypt(PublicKey pubKey, byte[] in) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			RSAPublicKey pk = (RSAPublicKey) pubKey;
			int chunkSize = pk.getModulus().bitLength() / 8 - 11;
			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
			cipher.init(1, pubKey);

			int inOffset = 0;
			while (inOffset < in.length) {
				int copyLength = (in.length - inOffset > chunkSize) ? chunkSize
						: in.length - inOffset;
				byte[] buffer = cipher.doFinal(in, inOffset, copyLength);
				baos.write(buffer);
				inOffset += copyLength;
			}
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return baos.toByteArray();
	}

	public static byte[] decrypt(PrivateKey priKey, byte[] in) {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			RSAPrivateKey pk = (RSAPrivateKey) priKey;
			int chunkSize = pk.getModulus().bitLength() / 8;
			Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
			cipher.init(2, priKey);
			int inOffset = 0;
			while (inOffset < in.length) {
				int copyLength = (in.length - inOffset > chunkSize) ? chunkSize
						: in.length - inOffset;
				byte[] buffer = cipher.doFinal(in, inOffset, copyLength);
				baos.write(buffer);
				inOffset += copyLength;
			}
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return baos.toByteArray();
	}

	public static boolean verify(PublicKey pubKey, byte[] content, byte[] sign) {
		return verify(pubKey, content, sign, DEFAULT_SIGNATURE_ALGORITHM);
	}

	public static boolean verify(PublicKey pubKey, byte[] content, byte[] sign,
			SignatureAlgorithm signatureAlgorithm) {
		try {
			Signature signature = Signature
					.getInstance(signatureAlgorithm.code);
			signature.initVerify(pubKey);
			signature.update(content);
			return signature.verify(sign);
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static byte[] sign(PrivateKey priKey, byte[] data) {
		return sign(priKey, data, DEFAULT_SIGNATURE_ALGORITHM);
	}

	public static byte[] sign(PrivateKey priKey, byte[] data,
			SignatureAlgorithm signatureAlgorithm) {
		try {
			Signature signature = Signature
					.getInstance(signatureAlgorithm.code);
			signature.initSign(priKey);
			signature.update(data);
			return signature.sign();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getMd5HexStringFromBytes(byte[] in) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("md5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] out = md.digest(in);
		StringBuilder sb = new StringBuilder(32);
		for (byte b : out) {
			sb.append(String.format("%02X", new Object[] { Byte.valueOf(b) }));
		}
		return sb.toString();
	}

	public static String getRandomCode(int length, char[] alphabet) {
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; ++i) {
			sb.append(alphabet[random.nextInt(alphabet.length)]);
		}
		return sb.toString();
	}

	public static String getBase58FromBytes(byte[] in) {
		char[] out = new char[(int) Math.ceil(in.length * Math.log(256.0D)
				/ Math.log(58.0D))];
		byte[] work = new byte[in.length];
		System.arraycopy(in, 0, work, 0, in.length);
		for (int i = 0; i < out.length; ++i) {
			out[i] = ALPHABET_58[byteMod(work, 58, 256)];
		}
		return new String(out);
	}

	public static byte[] getBytesFromBase58(String in, boolean cutZeroTail) {
		byte[] out = new byte[(int) Math.ceil(in.length() * Math.log(58.0D)
				/ Math.log(256.0D))];
		byte[] work = in.getBytes();
		for (int i = 0; i < work.length; ++i) {
			work[i] = INDEXES_58[work[i]];
			if (work[i] < 0) {
				throw new IllegalAccessError("Illegal character "
						+ in.charAt(i) + " at " + i);
			}
		}
		for (int i = 0; i < out.length; ++i) {
			out[i] = (byte) byteMod(work, 256, 58);
		}
		if ((cutZeroTail) && (out[(out.length - 1)] == 0)) {
			byte[] tout = new byte[out.length - 1];
			System.arraycopy(out, 0, tout, 0, tout.length);
			return tout;
		}
		return out;
	}

	public static byte[] getBytesFromBase58(String in) {
		return getBytesFromBase58(in, true);
	}

	private static int byteMod(byte[] in, int divisor, int radix) {
		int mod = 0;
		for (int i = in.length - 1; i >= 0; --i) {
			mod = mod * radix + (0xFF & in[i]);
			in[i] = (byte) (mod / divisor);
			mod %= divisor;
		}
		return mod;
	}

	public static String getUUID(int length) {
		String uuidStr = null;
		if (length <= 0) {
			throw new IllegalArgumentException();
		}
		byte[] bId = new byte[length];
		random.nextBytes(bId);
		uuidStr = getBase64FromBytes(bId);
		return uuidStr;
	}

	public static byte[] getBytesFromHex(String in) {
		try {
			byte[] out = new byte[in.length() / 2];
			for (int i = 0; i < in.length() / 2; ++i) {
				out[i] = (byte) Integer.parseInt(
						in.substring(i * 2, i * 2 + 2), 16);
			}
			return out;
		} catch (Exception e) {
		}
		return null;
	}

	public static byte[] getRandomBytes(int length) {
		byte[] ret = new byte[length];
		random.nextBytes(ret);
		return ret;
	}

	public static String getHexFromBytes(byte[] in) {
		try {
			StringBuilder sb = new StringBuilder();
			for (byte b : in) {
				sb.append(String.format("%02X",
						new Object[] { Byte.valueOf(b) }));
			}
			return sb.toString();
		} catch (Exception e) {
		}
		return null;
	}

	public static byte[] getMd5(byte[] in, byte[] salt) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("md5");
			md5.update(in, 0, in.length);
			if (salt != null)
				md5.update(salt, 0, salt.length);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return md5.digest();
	}

	public static String getMd5Sign(Map<String, String[]> paramMap,
			Set<String> maskParams, String tailStr) {
		return getMd5Sign(paramMap, maskParams, "", "", true, false, tailStr);
	}

	public static String getMd5Sign(Map<String, String[]> paramMap,
			Set<String> maskParams, String pairSplit, String valueSplit,
			boolean needOrder, boolean skipEmpty, String tailStr) {
		StringBuilder sb = new StringBuilder(buildStringFromMap(paramMap,
				maskParams, pairSplit, valueSplit, needOrder, skipEmpty));
		sb.append(tailStr);
		try {
			return getMd5HexStringFromBytes(sb.toString().getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("all")
	public static String buildStringFromMap(Map<String, String[]> paramMap,
			Set<String> maskParams, String pairSplit, String valueSplit,
			boolean needOrder, boolean skipEmpty) {
		List<String> keyList = new Vector(paramMap.keySet());
		if (needOrder) {
			Collections.sort(keyList, new Comparator() {
				@Override
				public int compare(Object o1, Object o2) {
					return o1.toString().compareTo(o2.toString());
				}
			});
		}
		StringBuilder sb = new StringBuilder();
		for (String key : keyList) {
			if ((maskParams != null) && (maskParams.contains(key))) {
				continue;
			}
			List<String> valueList = new Vector(Arrays.asList((String[]) paramMap
					.get(key)));
			if (needOrder) {
				Collections.sort(valueList, new Comparator() {
					@Override
					public int compare(Object o1, Object o2) {
						return o1.toString().compareTo(o2.toString());
					}
				});
			}
			for (String value : valueList) {
				if (skipEmpty) {
					if (value == null)
						continue;
					if (value.trim().length() == 0) {
						continue;
					}
				}
				if (sb.length() > 0) {
					sb.append(pairSplit);
				}
				sb.append(key).append(valueSplit).append(value);
			}
		}
		return sb.toString();
	}

	public static String getRsaSign(PrivateKey priKey,
			Map<String, String[]> paramMap, Set<String> maskParams) {
		return getRsaSign(priKey, paramMap, maskParams, "", "", true, false);
	}

	public static String getRsaSign(PrivateKey priKey,
			Map<String, String[]> paramMap, Set<String> maskParams,
			String pairSplit, String valueSplit, boolean needOrder,
			boolean skipEmpty) {
		String signStr = buildStringFromMap(paramMap, maskParams, pairSplit,
				valueSplit, needOrder, skipEmpty);
		try {
			return getBase64FromBytes(sign(priKey, signStr.getBytes("UTF-8")));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Boolean verifyRsaSign(PublicKey pubKey,
			Map<String, String[]> paramMap, Set<String> maskParams,
			String sign, String pairSplit, String valueSplit,
			boolean needOrder, boolean skipEmpty) {
		String signStr = buildStringFromMap(paramMap, maskParams, pairSplit,
				valueSplit, needOrder, skipEmpty);
		try {
			return Boolean.valueOf(verify(pubKey, signStr.getBytes("UTF-8"),
					getBytesFromBase64(sign)));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return Boolean.valueOf(false);
	}

	public static Boolean verifyRsaSign(PublicKey pubKey,
			Map<String, String[]> paramMap, Set<String> maskParams, String sign) {
		return verifyRsaSign(pubKey, paramMap, maskParams, sign, "", "", true,
				false);
	}

	public static enum SignatureAlgorithm {
		SHA1WITHRSA, MD5WITHRSA;

		private final String code = "";

		public static SignatureAlgorithm fromCode(String code) {
			for (SignatureAlgorithm signatureAlgorithm : values()) {
				if (signatureAlgorithm.code.equals(code)) {
					return signatureAlgorithm;
				}
			}
			return null;
		}
	}

}