using System;
using System.ComponentModel.DataAnnotations;

namespace Portfolio.Models
{
    public class Skill
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Name is required")]
        [StringLength(100, ErrorMessage = "Name cannot exceed 100 characters")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Type is required")]
        public string Type { get; set; }

        [Required(ErrorMessage = "Percentage is required")]
        [Range(0, 100, ErrorMessage = "Percentage must be between 0 and 100")]
        public int Percentage { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}