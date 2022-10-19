import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { timingSafeEqual } from 'crypto';
import * as nodemailer from 'nodemailer';
import { EmailDto } from 'src/dto/email.dto';

@Injectable()
export class EmailService {
    private log = new Logger(EmailService.name);

    constructor(private configService: ConfigService) { }

    async sendEmail(emaildto: EmailDto) {


        var transporter = nodemailer.createTransport({
            host: this.configService.get<string>('SMTP_HOST'),
            port: this.configService.get<number>('SMTP_PORT'),
            secure: this.configService.get<boolean>('SMTP_SECURE'), // upgrade later with STARTTLS
            auth: {
                user: this.configService.get<string>('SMTP_EMAIL'),
                pass: this.configService.get<string>('SMTP_PASSWORD'),
            },
        });

        this.log.log(emaildto);

        emaildto.from = `Sistema Integrado Souza <${this.configService.get<string>('SMTP_EMAIL')}>`;

        await transporter.sendMail(emaildto);
    }
}
