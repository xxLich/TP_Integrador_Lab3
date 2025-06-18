using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Negocios
{
    public static class Seguridad
    {
        public static byte[] CalcularSHA256Bytes(string input)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(input);
                return sha256.ComputeHash(bytes); // Devuelve byte[]
            }
        }
    }
}