import java.security.MessageDigest
/**
 * Created by allenli on 5/14/14.
 */
class SHACodec {
    static encode = { target ->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(target.getBytes('UTF-8'))
        return new String(md.digest()).encodeAsBase64()
}
    }
