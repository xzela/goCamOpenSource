import crypto from 'crypto';

export class AvsRandom {

	static generateRandomString(length = 16) {

		return crypto
			.randomBytes(length)
			.toString('base64')
			.slice(0, length);
	}

}
