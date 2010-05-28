import java.security.*
import sun.misc.*

class PasswordCodec {
	
	static encode = {
		str ->
		MessageDigest digest = MessageDigest.getInstance("SHA")
		digest.update(str.getBytes("UTF-8"))
		return new BASE64Encoder().encode(digest.digest())
	}
}
