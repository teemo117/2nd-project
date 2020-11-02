package Mail;

import org.apache.commons.mail.HtmlEmail;

public class MailUtil {
    public static void sendMail(String email, String subject, String msg) throws Exception {
        // Mail Server 설정
        String charSet = "utf-8";  //메일 할글 설정
        String hostSMTP = "smtp.gmail.com";  // SMTP 서버명
        String hostSMTPid = "betterclass1";       // 아이디
        String hostSMTPpwd = "wjddn123!@";    // 비밀번호
        // 보내는 사람
        String fromEmail = "betterclass1@gmail.com"; //"보내는사람@메일.com"
        String fromName = "betterclass1"; //"보내는사람 이름"
        // email 전송
        try {
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);     // SSL 사용 (TLS가 없는 경우 SSL 사용)
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(587);          // SMTP 포트 번호

            mail.setAuthentication(hostSMTPid, hostSMTPpwd);
            mail.setStartTLSEnabled(true);  // TLS 사용
            mail.addTo(email);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(msg);
            mail.send();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

