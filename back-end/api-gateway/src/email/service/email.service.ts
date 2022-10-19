import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ClientProxy, ClientProxyFactory, Transport } from '@nestjs/microservices';
import { EmailDto } from '../dto/email.dto';


@Injectable()
export class EmailService {
    private logger = new Logger(EmailService.name)

    private clientAdminBackend: ClientProxy;
    constructor(private configService: ConfigService) {
        this.clientAdminBackend = ClientProxyFactory.create({
            transport: Transport.RMQ,
            options: {
                urls: [`amqp://${this.configService.get<String>('RABBITMQ_USER')}:${this.configService.get<String>('RABBITMQ_PASSWORD')}@${this.configService.get<String>('RABBITMQ_HOST')}:${this.configService.get<String>('RABBITMQ_PORT')}`],
                queue: 'admin-email',
                noAck: false,
            }
        })
    }
    async sendEmail() {
        var emailDto = new EmailDto();

        emailDto.to = 'jvrs_souza@hotmail.com';
        emailDto.subject = 'teste de email';
        emailDto.text = 'teste de envio de email';

        this.logger.log(emailDto);

        await this.clientAdminBackend.emit('enviar-email', emailDto);
    }
}
