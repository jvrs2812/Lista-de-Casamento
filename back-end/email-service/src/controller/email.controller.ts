import { Controller, Get } from '@nestjs/common';
import { EventPattern, Payload } from '@nestjs/microservices';
import { EmailDto } from 'src/dto/email.dto';
import { EmailService } from 'src/service/email.service';


@Controller()
export class EmailController {
    constructor(private readonly emailService: EmailService) {

    }

    @EventPattern('enviar-email')
    async sendEmail(@Payload() emaildto: EmailDto) {
        await this.emailService.sendEmail(emaildto);
    }
}
