import { Controller, Get } from '@nestjs/common';
import { EmailService } from '../service/email.service';

@Controller('ap1/sendemail')
export class EmailController {
    constructor(private readonly emailService: EmailService) { }

    @Get()
    async sendEmail() {
        await this.emailService.sendEmail();
    }

}
