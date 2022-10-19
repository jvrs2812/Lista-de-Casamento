import { ConfigService } from '@nestjs/config';
import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { AppModule } from './app.module';

async function bootstrap() {
  const configService = new ConfigService();

  const app = await NestFactory.createMicroservice<MicroserviceOptions>(
    AppModule,
    {
      transport: Transport.RMQ,
      options: {
        urls: [`amqp://${configService.get<String>('RABBITMQ_USER')}:${configService.get<String>('RABBITMQ_PASSWORD')}@${configService.get<String>('RABBITMQ_HOST')}:${configService.get<String>('RABBITMQ_PORT')}`],
        queue: 'admin-email',
        noAck: true,
      }
    },

  );
  await app.listen();
}
bootstrap();