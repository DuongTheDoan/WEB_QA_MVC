using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Project.Models
{
    // class nay tác động đến ueser
    [Table("Users")]
    public class ItemUser
    {  // định nghĩa key
        [Key]

        public int Id { get; set; } 
        public string Name { get; set; }
        public string Email { get; set; }   
        public string Password { get; set; }

       
    }
}
