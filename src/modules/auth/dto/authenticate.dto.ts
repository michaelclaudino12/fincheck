import { IsString, IsEmail, IsNotEmpty, MinLength } from 'class-validator';

export class AuthenticateDto {
    @IsString()
    @IsEmail()
    @IsNotEmpty()
    email: string;

    @IsString()
    @IsNotEmpty()
    @MinLength(8)
    password: string;
}