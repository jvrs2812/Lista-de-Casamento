import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EmailController } from './controller/email.controller';
import { EmailService } from './service/email.service';

@Module({
  imports: [ConfigModule.forRoot(
    { isGlobal: true }
  )],
  controllers: [AppController, EmailController],
  providers: [AppService, EmailService],
})
export class AppModule { }
